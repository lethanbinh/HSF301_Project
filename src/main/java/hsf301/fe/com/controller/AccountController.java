package hsf301.fe.com.controller;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.request.UserDTO;
import hsf301.fe.com.request.UserRegisterDTO;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AccountController {

    private final UserService userService;

    @GetMapping("/manage-account")
    public String manageAccount (Model model) {
        List<User> users = userService.listAllUser();
        model.addAttribute("profiles", users);
        return "manage-account";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute UserDTO userDTO, HttpServletRequest request, Model model){
        // đưa biến user vô session
        User user = userService.findByUsernameAndPassword(userDTO);
        HttpSession session = request.getSession();
        if (user != null){
            session.setAttribute("USER", user);
            return "product";
        } else {
            model.addAttribute("loginError", "Invalid username or password. Please try again.");
            return "login";
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
