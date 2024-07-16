package hsf301.fe.com.repository.custom;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepositoryCustom {
    List<Product> findAllCustom(ProductSearchRequestDTO productSearchRequestDTO);
}
