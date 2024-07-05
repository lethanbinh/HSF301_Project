package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.Product;
import hsf301.fe.com.repository.ProductRepository;
import hsf301.fe.com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product findById(int productId) {
        return productRepository.findById(productId);
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAllProducts();
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
}
