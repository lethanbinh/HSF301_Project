package hsf301.fe.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
    @GetMapping("/product-list")
    public String product () {
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
