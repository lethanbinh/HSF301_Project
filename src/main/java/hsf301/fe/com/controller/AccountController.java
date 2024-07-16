package hsf301.fe.com.controller;

import hsf301.fe.com.converter.AccountConverter;
import hsf301.fe.com.converter.ProductConverter;
import hsf301.fe.com.dto.AccountEditDTO;
import hsf301.fe.com.dto.ProductEditDTO;
import hsf301.fe.com.pojo.Product;
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
        userRepository.save(AccountConverter.toUser(accountEditDTO));
    }
//    @ResponseBody
//    @DeleteMapping("/manage-product")
//    public ResponseEntity<String> deleteProduct (@RequestBody ProductEditDTO productEditDTO) {
//        int productId = Math.toIntExact(productEditDTO.getId());
//        Product product = productRepository.findById(productId);
//        if(!product.getOrderItems().isEmpty()){
//            return ResponseEntity.ok("Cannot delete this product!");
//        }
//        productRepository.deleteById(productId);
//        return ResponseEntity.ok("Delete product successfully");
//    }
}
