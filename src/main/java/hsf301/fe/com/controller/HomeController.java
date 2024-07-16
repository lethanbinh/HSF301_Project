package hsf301.fe.com.controller;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.service.ProductService;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request) {
        User userDemo = userService.findByUsername("admin");
        HttpSession session = request.getSession();
        session.setAttribute("USER", userDemo);
        model.addAttribute("PRODUCT_LIST", productService.getAllProducts());
        return "index";
    }
}
