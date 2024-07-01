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
    public String manageProduct () {
        return "manage-product";
    }

    @GetMapping("/create-product")
    public String showCreateProductPage(Model model) {
        ProductDTO productDTO = new ProductDTO();
        model.addAttribute("productDTO", productDTO);
        return "create-product";
    }

    @PostMapping("/create")
    public String createProduct(@Valid @ModelAttribute("productDTO") ProductDTO productDTO, BindingResult bindingResult) {
        if(productDTO.getImageUrl().isEmpty()){
            bindingResult.addError(new FieldError("productDTO", "imageUrl", "Please enter image url"));
        }

        if(productDTO.getName().isEmpty()){
            bindingResult.addError(new FieldError("productDTO", "name", "Please enter name"));
        }

        if(productDTO.getDescription().isEmpty()){
            bindingResult.addError(new FieldError("productDTO", "description", "Please enter description"));
        }

        if(productDTO.getPrice() < 0){
            bindingResult.addError(new FieldError("productDTO", "price", "Price must be greater than 0"));
        }

        if(productDTO.getCategory().isEmpty()){
            bindingResult.addError(new FieldError("productDTO", "category", "Please enter category"));
        }

        if(productDTO.getStock() < 1){
            bindingResult.addError(new FieldError("productDTO", "stock", "Stock must be greater than 1"));
        }

        if(bindingResult.hasErrors()){
            return "create-product";
        }

        String image = saveImage(productDTO);
        Product product = new Product();
        product.setName(productDTO.getName());
        product.setDescription(productDTO.getDescription());
        product.setPrice(productDTO.getPrice());
        product.setCategory(productDTO.getCategory());
        product.setStock(productDTO.getStock());
        product.setImageUrl(image);
        productService.save(product);
        return  "redirect:/product-list";
    }

    @GetMapping("/edit")
    public String showEditProductProduct (Model model, @RequestParam int id) {
        try {
            Product product = productService.findById(id);
            model.addAttribute("product", product);

            ProductDTO productDTO = new ProductDTO();
            productDTO.setName(product.getName());
            productDTO.setDescription(product.getDescription());
            productDTO.setPrice(product.getPrice());
            productDTO.setCategory(product.getCategory());
            productDTO.setStock(product.getStock());

            model.addAttribute("productDTO", productDTO);
        }catch (Exception e){
            System.out.println("Error at showEditProductProduct");
            return "redirect:/product-list";
        }

        return "edit-product";
    }

    @PostMapping("/edit")
    public String editProduct(Model model,@Valid @ModelAttribute ProductDTO productDTO, @RequestParam int id, BindingResult bindingResult) {
        try {
            Product product = productService.findById(id);
            model.addAttribute("product", product);
            if(bindingResult.hasErrors()){
                return "edit-product";
            }

            if(!productDTO.getImageUrl().isEmpty()){
                //delete old image
                String uploadDir = "src/main/resources/static/img/";
                Path oldImagePath = Paths.get(uploadDir + productDTO.getImageUrl());

                try {
                    Files.delete(oldImagePath);
                }catch (Exception e){
                    System.out.println("Error at delete oldImagePath");
                }

                MultipartFile image = productDTO.getImageUrl();
                String storageFileName = image.getOriginalFilename();
                try(InputStream inputStream = image.getInputStream();){
                    Files.copy(inputStream, Paths.get(uploadDir + storageFileName), StandardCopyOption.REPLACE_EXISTING);
                }
                product.setImageUrl(storageFileName);
            }

            product.setName(productDTO.getName());
            product.setDescription(productDTO.getDescription());
            product.setPrice(productDTO.getPrice());
            product.setCategory(productDTO.getCategory());
            product.setStock(productDTO.getStock());

            productService.save(product);

        }catch (Exception e){
            System.out.println("Error at editProduct");
            return "redirect:/product-list";
        }
        return "redirect:/product-list";
    }

    //Delete product when confirm delete product
    @GetMapping("/delete")
    public String deleteProduct(@RequestParam int id){
        try {
            Product product = productService.findById(id);
            //Delete product image
            Path imagePath = Paths.get("src/main/resources/static/img/", product.getImageUrl());
            try {
                Files.delete(imagePath);
            }catch (Exception e){
                System.out.println("Error at delete oldImagePath");
            }

            //delete the product
            productService.delete(id);
        }catch (Exception e){
            System.out.println("Error at deleteProduct");
        }
        return "redirect:/product-list";
    }


    private String saveImage(ProductDTO productDTO) {
        //Save image file
        MultipartFile image = productDTO.getImageUrl();
        String storageFileName = image.getOriginalFilename();
        try {
            String uploadDir = "src/main/resources/static/img/";
            Path uploadPath = Paths.get(uploadDir);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            try (InputStream inputStream = image.getInputStream()) {
                Files.copy(inputStream, Paths.get(uploadDir + storageFileName), StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return storageFileName;
    }
}
