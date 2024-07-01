package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
    Cart findById (int cartId);
    Cart findByUserId (int userId);
}
