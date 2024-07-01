package hsf301.fe.com.controller;

import hsf301.fe.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
    public String productDetail () {
        return "product-detail";
    }

    @GetMapping("/manage-product")
    public String manageProduct () {
        return "manage-product";
    }
}
