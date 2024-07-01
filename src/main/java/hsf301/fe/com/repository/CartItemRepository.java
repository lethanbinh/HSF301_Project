package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
    CartItem findById (int cartItemId);
    List<CartItem> findByCartId (int cartId);
}
