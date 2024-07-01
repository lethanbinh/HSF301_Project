package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
    OrderItem findById (int orderItemId);
    List<OrderItem> findByOrderId (int orderId);
}
