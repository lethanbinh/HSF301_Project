package hsf301.fe.com.service;

import hsf301.fe.com.pojo.Cart;
import org.springframework.stereotype.Service;

@Service
public interface OrderService {
    Cart addItemToCart (int productId, String username);
    Cart updateItemQuantity (int cartItemId, String username, int quantity);
    Cart removeItemFromCart (int cartItemId);
    boolean checkout (String username);
    void updateCartTotal (Cart cart);
}
