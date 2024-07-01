package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    Order findById (int orderId);
    List<Order> findByUserId (int userId);
    List<Order> findByOrderDate (Date orderDate);
}
