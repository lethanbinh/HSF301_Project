package hsf301.fe.com.controller;

import hsf301.fe.com.dto.AccountEditDTO;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AccountController {
    private final UserRepository userRepository;

    public AccountController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String login (HttpServletRequest request) {
        return "login";
    }

    @GetMapping("/logout")
    public String logout (HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "login";
    }

    @GetMapping("/register")
    public String register () {
        return "register";
    }

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
}
