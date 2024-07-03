package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>, CrudRepository<Product, Integer> {
    Product findById (int productId);
    @Query(value = "SELECT * FROM products WHERE category LIKE %:searchValue% OR name LIKE %:searchValue% OR description LIKE %:searchValue%", nativeQuery = true)
    List<Product> getAllProductCustom(@Param("searchValue") String searchValue);

}
