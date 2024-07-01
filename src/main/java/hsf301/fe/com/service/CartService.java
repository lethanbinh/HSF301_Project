package hsf301.fe.com.service;

import hsf301.fe.com.pojo.Cart;
import org.springframework.stereotype.Service;

@Service
public interface CartService {
    Cart addProductToCart (int productId, String username);
    Cart updateProductQuantity (int productId, String username);
}
