package hsf301.fe.com.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String login (HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("USER", "");
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
}
