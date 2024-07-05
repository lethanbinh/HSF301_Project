package hsf301.fe.com.controller;

import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {

    @Autowired
    private UserService userService;

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

    @GetMapping("register")
    public String register () {
        return "register";
    }

    @GetMapping("/manage-account")
    public String manageAccount (Model model) {
        model.addAttribute("profiles", userService.findAll());
        return "manage-account";
    }
}
