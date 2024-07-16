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

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AccountController {

    private final UserService userService;

    private final UserRepository userRepository;

    @GetMapping("/manage-account")
    public ModelAndView showManageAccount () {
        ModelAndView mav = new ModelAndView("manage-account");
        List<User> accountList = userRepository.findAll();
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
    public String login(@ModelAttribute UserDTO userDTO, HttpServletRequest request, Model model){
        // đưa biến user vô session
        User user = userService.findByUsernameAndPassword(userDTO);
        HttpSession session = request.getSession();
        if (user != null){
            session.setAttribute("USER", user);
            return "redirect:/";
        } else {
            model.addAttribute("loginError", "Invalid username or password. Please try again.");
            return "redirect:/login";
        }
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserRegisterDTO userRegisterDTO, Model model){
        // đưa biến user vô session
        String result = userService.registerUser(userRegisterDTO);
        if (result == null){
          model.addAttribute("notMatch", "Password doesn't match with confirm password");
          return "register";
        } else {
            model.addAttribute("notMatch", "User has been registered successfully");
            return "login";
        }
    }


}
