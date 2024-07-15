package hsf301.fe.com.controller;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping(value="/product-list")
    public ModelAndView productList(@ModelAttribute("productSearch") ProductSearchRequestDTO productSearch) {
        ModelAndView mav = new ModelAndView("product");
        System.out.println(productSearch.getSortCriteria());
        System.out.println(productSearch.getProductName());
        if(productSearch.getProductName() == null) {
            mav.addObject("PRODUCT_LIST", productService.findAll());
        }else{
            mav.addObject("PRODUCT_LIST", productService.getAllProductCustom(productSearch.getProductName()));

        }
        return mav;
    }

    @GetMapping(value="/product-detail")
    public String productDetail (Model model, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.addAttribute("PRODUCT", productService.findById(id));
        return "product-detail";
    }

    @GetMapping(value="/manage-product")
    public String manageProduct () {
        return "manage-product";
    }
}
