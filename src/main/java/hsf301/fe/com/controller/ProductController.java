package hsf301.fe.com.controller;

import hsf301.fe.com.dto.ProductDTO;
import hsf301.fe.com.pojo.Product;
import hsf301.fe.com.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/product-list")
    public String product (Model model) {
        model.addAttribute("PRODUCT_LIST", productService.findAll());
        return "product";
    }

    @GetMapping("/product-detail")
    public String productDetail (Model model, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.addAttribute("PRODUCT", productService.findById(id));
        return "product-detail";
    }

    @GetMapping("/manage-product")
    public String manageProduct (Model model) {
        model.addAttribute("products", productService.findAll());
        return "manage-product";
    }

    @PostMapping("/add")
    public String addProduct(@RequestParam("name") String name,
                             @RequestParam("description") String description,
                             @RequestParam("price") double price,
                             @RequestParam("category") String category,
                             @RequestParam("stock") int stock,
                             @RequestParam("imageFileName") String imageFileName) {
        Product product = new Product(name, description, price, category, stock, imageFileName);
        productService.save(product);
        return "redirect:/manage-product";
    }


}
