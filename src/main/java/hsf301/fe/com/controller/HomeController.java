package hsf301.fe.com.controller;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home (ModelAndView modelAndView, HttpServletRequest request) {
        User userDemo = userService.findByUsername("admin");
        HttpSession session = request.getSession();
        session.setAttribute("USER", userDemo);
        return "index";
    }
}
