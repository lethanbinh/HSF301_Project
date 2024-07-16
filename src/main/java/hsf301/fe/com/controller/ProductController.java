package hsf301.fe.com.controller;

import hsf301.fe.com.converter.ProductConverter;
import hsf301.fe.com.dto.ProductEditDTO;
import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import hsf301.fe.com.repository.ProductRepository;
import hsf301.fe.com.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/product-list")
    public ModelAndView product (@ModelAttribute("productSearch") ProductSearchRequestDTO productSearchRequestDTO) {
        ModelAndView mav = new ModelAndView("product");
        List<Product> productList = productService.findAllCustom(productSearchRequestDTO);
        mav.addObject("PRODUCT_LIST", productList);
        List<String> categoryList = new ArrayList<String>();
        for(Product product : productService.findAll()) {
            if(!categoryList.contains(product.getCategory())) {
                categoryList.add(product.getCategory());
            }
        }
        mav.addObject("CATEGORY_LIST", categoryList);
        return mav;
    }

    @GetMapping("/product-detail")
    public String productDetail (Model model, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.addAttribute("PRODUCT", productService.findById(id));
        return "product-detail";
    }

    @GetMapping("/manage-product")
    public ModelAndView showManageProduct () {
        ModelAndView mav = new ModelAndView("manage-product");
        List<Product> productList = productService.findAll();
        mav.addObject("PRODUCT_LIST", productList);
        return mav;
    }
    @PostMapping("/manage-product")
    public void addOrEditProduct (@RequestBody ProductEditDTO productEditDTO) {
        productRepository.save(ProductConverter.toProduct(productEditDTO));
    }
    @DeleteMapping("/manage-product")
    public void deleteProduct (@RequestBody ProductEditDTO productEditDTO) {
       productRepository.deleteById(Math.toIntExact(productEditDTO.getId()));
    }
}
