package hsf301.fe.com.controller;

import hsf301.fe.com.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/product-list")
    public String product (@RequestParam(value = "searchValue", required = false) String searchValue, Model model) {
        if(searchValue == null) {
            model.addAttribute("PRODUCT_LIST", productService.findAll());
        }else{
            model.addAttribute("searchValue", searchValue);
            model.addAttribute("PRODUCT_LIST", productService.getAllProductCustom(searchValue));
        }
        return "product";
    }

    @GetMapping("/product-detail")
    public String productDetail (Model model, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.addAttribute("PRODUCT", productService.findById(id));
        return "product-detail";
    }

    @GetMapping("/manage-product")
    public String manageProduct () {
        return "manage-product";
    }
}
