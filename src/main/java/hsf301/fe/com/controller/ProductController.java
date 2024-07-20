package hsf301.fe.com.controller;

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

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;


    //product list
    @GetMapping("/product-list")
    public ModelAndView product (@ModelAttribute("productSearch") ProductSearchRequestDTO productSearchRequestDTO) {
        ModelAndView mav = new ModelAndView("product");
        List<Product> productList = productService.findAllCustom(productSearchRequestDTO);
        mav.addObject("PRODUCT_LIST", productList);
        List<String> categoryList = new ArrayList<String>();
        for(Product product : productService.getAllProducts()) {
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
    public String manageProduct (Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "manage-product";
    }

    //Start CRUD Product
    @PostMapping("/add")
    public String addProduct(@RequestParam("name") String name,
                             @RequestParam("description") String description,
                             @RequestParam("price") double price,
                             @RequestParam("category") String category,
                             @RequestParam("stock") int stock,
                             @RequestParam("imageFileName") String imageFileName) {
        Product product = new Product(name, description, price, category, stock, imageFileName, true);
        productService.save(product);
        return "redirect:/manage-product";
    }

    @PostMapping("/delete/{productId}")
    public String deleteProduct(@PathVariable int productId, Model model) {
        productService.delete(productId);
        return "redirect:/manage-product";
    }

    @PostMapping("/edit")
    public String editProduct(@RequestParam("editProductId") int productId,
                              @RequestParam("editProductName") String name,
                              @RequestParam("editProductDescription") String description,
                              @RequestParam("editProductPrice") double price,
                              @RequestParam("editProductCategory") String category,
                              @RequestParam("editProductStock") int stock,
                              @RequestParam("editProductImage") String imageFileName) throws Exception {
        Product product = productService.findById(productId);

        if (product != null) {
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setCategory(category);
            product.setStock(stock);
            product.setImageUrl(imageFileName);

            productService.update(productId, product);
        }

        return "redirect:/manage-product";
    }

    //End CRUD Product




}
