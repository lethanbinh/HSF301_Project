package hsf301.fe.com.service;

import hsf301.fe.com.pojo.Cart;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    Cart addItemToCart (int productId, String username);
    Cart updateItemQuantity (int cartItemId, String username, int quantity);
    Cart removeItemFromCart (int cartItemId);
    boolean createOrder (String username);
    void updateCartTotal (Cart cart);
    void removeAllItemsFromCart(Cart cart);
    int getTotalItemsInCart(String username);
}
