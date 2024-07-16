package hsf301.fe.com.service;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.response.UserOrderResponseDTO;

import java.util.List;


public interface OrderService {
    List<UserOrderResponseDTO> getUserOrder(User user);
}
