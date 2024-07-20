package hsf301.fe.com.controller;

import hsf301.fe.com.dto.AccountEditDTO;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.UserRepository;
import hsf301.fe.com.request.UserDTO;
import hsf301.fe.com.request.UserRegisterDTO;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AccountController {

    private final UserService userService;

    private final UserRepository userRepository;

    @GetMapping("/manage-account")
    public ModelAndView showManageAccount () {
        ModelAndView mav = new ModelAndView("manage-account");
        List<User> accountList = userRepository.listAllUser();
        mav.addObject("ACCOUNT_LIST", accountList);
        return mav;
    }
    @PostMapping("/manage-account")
    public void addOrEditAccount (@RequestBody AccountEditDTO accountEditDTO) {
        User user = new User();
        if(accountEditDTO.getId() != null){
            int id = Math.toIntExact(accountEditDTO.getId());
            user.setId(id);
            User oldUser = userRepository.findById(id);
            user.setPassword(oldUser.getPassword());
        }else{
            user.setPassword(accountEditDTO.getPassword());
        }
        user.setAddress(accountEditDTO.getAddress());
        user.setEmail(accountEditDTO.getEmail());
        user.setAvatar(accountEditDTO.getAvatar());
        user.setPhone(accountEditDTO.getPhone());
        user.setUsername(accountEditDTO.getUserName());
        user.setRole("USER");
        if(accountEditDTO.getStatus().equals("Active")){
            user.setStatus(true);
        }else{
            user.setStatus(false);
        }
        userRepository.save(user);
    }

    @PostMapping("/login")
    public String login(@ModelAttribute UserDTO userDTO, HttpServletRequest request, RedirectAttributes redirectAttributes){
        User user = userService.findByUsernameAndPassword(userDTO);
        HttpSession session = request.getSession();
        if (user != null && user.isStatus()){
            session.setAttribute("USER", user);
            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("loginError", "Invalid username or password. Please try again.");
            return "redirect:/login";
        }
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserRegisterDTO userRegisterDTO, Model model){
        String result = userService.registerUser(userRegisterDTO);
        if (!"success".equals(result)) {
            model.addAttribute("notMatch", result);
            return "register";
        } else {
            model.addAttribute("successMessage", "User has been registered successfully");
            return "login";
        }
    }


}
