package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    Product findById (int productId);

    @Query("SELECT p FROM Product p WHERE p.status = true")
    List<Product> findAllProducts();
}
