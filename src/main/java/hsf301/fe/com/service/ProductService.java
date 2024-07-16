package hsf301.fe.com.service;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    Product findById (int productId);
    List<Product> findAll();
    List<Product> findAllCustom (ProductSearchRequestDTO productSearchRequestDTO);
}
