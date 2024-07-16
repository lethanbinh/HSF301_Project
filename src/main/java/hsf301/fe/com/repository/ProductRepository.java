package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.Product;
import hsf301.fe.com.repository.custom.ProductRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>, CrudRepository<Product, Integer>, ProductRepositoryCustom {
    Product findById (int productId);


}
