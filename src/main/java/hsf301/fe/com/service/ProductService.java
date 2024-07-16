package hsf301.fe.com.service;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    Product findById(int productId);

    List<Product> getAllProducts();

    Product save(Product product);

    void delete(int id);

    Product update(int productID, Product product) throws Exception;

    List<Product> findAllCustom(ProductSearchRequestDTO productSearchRequestDTO);

}
