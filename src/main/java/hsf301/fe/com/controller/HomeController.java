package hsf301.fe.com.controller;

import hsf301.fe.com.pojo.Cart;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.CartRepository;
import hsf301.fe.com.repository.UserRepository;
import hsf301.fe.com.service.ProductService;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;

@Controller
public class HomeController {
    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("USER");

        if (currentUser != null) {
            if (currentUser.getCart() == null) {
                Cart cart = new Cart();
                cart.setUser(currentUser);
                cart.setCreatedDate(new Date());
                cartRepository.save(cart);

                currentUser.setCart(cart);
                userRepository.save(currentUser);
            }
            model.addAttribute("currentUser", currentUser);
            model.addAttribute("PRODUCT_LIST", productService.getAllProducts());
            return "index";
        } else {
            return "login";
        }
    }
}
