package hsf301.fe.com.converter;

import hsf301.fe.com.dto.ProductEditDTO;
import hsf301.fe.com.pojo.Product;

public class ProductConverter {
    public static Product toProduct(ProductEditDTO productEditDTO){
        Product product = new Product();
        if(productEditDTO.getId() != null){
            product.setId(Math.toIntExact(productEditDTO.getId()));
        }
        product.setName(productEditDTO.getName());
        product.setDescription(productEditDTO.getDescription());
        product.setPrice(productEditDTO.getPrice());
        product.setCategory(productEditDTO.getCategory());
        product.setStock(Math.toIntExact(productEditDTO.getStock()));
        product.setImageUrl(productEditDTO.getImageUrl());
        return product;
    }
}
