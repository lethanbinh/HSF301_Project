package hsf301.fe.com.service.impl;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import hsf301.fe.com.repository.ProductRepository;
import hsf301.fe.com.repository.custom.ProductRepositoryCustom;
import hsf301.fe.com.repository.custom.ProductRepositoryCustomImpl;
import hsf301.fe.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductRepositoryCustomImpl productRepositoryCustom;

    @Override
    public Product findById(int productId) {
        return productRepository.findById(productId);
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAllProducts();
    }

    @Override
    public Product update(int productID, Product request) throws Exception {
        Product product = productRepository.findById(productID);
        if (product == null) {
            throw new Exception("PRODUCT NOT FOUND");
        }
        product.setName(request.getName());
        product.setName(request.getName());
        product.setImageUrl(request.getImageUrl());
        product.setPrice(request.getPrice());
        product.setCategory(request.getCategory());
        product.setDescription(request.getDescription());
        return productRepository.save(product);
    }

    @Override
    public void delete(int id) {
        Product product = productRepository.findById(id);
        product.setStatus(false);
        productRepository.save(product);
    }

    @Override
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> findAllCustom(ProductSearchRequestDTO productSearchRequestDTO) {
        return productRepositoryCustom.findAllCustom(productSearchRequestDTO);
    }
}
