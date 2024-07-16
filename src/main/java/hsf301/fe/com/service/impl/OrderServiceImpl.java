package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.Order;
import hsf301.fe.com.pojo.OrderItem;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.OrderItemRepository;
import hsf301.fe.com.repository.OrderRepository;
import hsf301.fe.com.repository.UserRepository;
import hsf301.fe.com.response.ItemDetailResponseDTO;
import hsf301.fe.com.response.UserOrderResponseDTO;
import hsf301.fe.com.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    @Override
    public List<UserOrderResponseDTO> getUserOrder(User user) {
        List<UserOrderResponseDTO> result = new ArrayList<>();
        List<Order> userOrder = orderRepository.findByUserId(user.getId());
        for (Order order : userOrder) {
            List<ItemDetailResponseDTO> listItemDetailResponseDTO = new ArrayList<>();
            UserOrderResponseDTO userOrderResponseDTO = new UserOrderResponseDTO();
            userOrderResponseDTO.setOrderId(order.getId());
            userOrderResponseDTO.setName(user.getUsername());
            userOrderResponseDTO.setOrderDate(order.getOrderDate().toString());
            userOrderResponseDTO.setStatus(order.getStatus());
            double totalPrice = 0.0;
            List<OrderItem> listOrderItem = orderItemRepository.findAllByOrderId(order.getId());
            for (OrderItem orderItem : listOrderItem) {
                ItemDetailResponseDTO itemDetailResponseDTO = new ItemDetailResponseDTO();
                itemDetailResponseDTO.setProductName(orderItem.getProduct().getName());
                itemDetailResponseDTO.setPrice(String.valueOf(orderItem.getProduct().getPrice()));
                itemDetailResponseDTO.setQuantity(String.valueOf(orderItem.getQuantity()));
                totalPrice += (orderItem.getProduct().getPrice() * orderItem.getQuantity());
                listItemDetailResponseDTO.add(itemDetailResponseDTO);
            }
            userOrderResponseDTO.setTotalAmount(String.valueOf(totalPrice));
            userOrderResponseDTO.setListItemDetail(listItemDetailResponseDTO);
            result.add(userOrderResponseDTO);
        }
        return result;
    }
}
