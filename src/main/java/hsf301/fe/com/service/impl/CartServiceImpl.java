package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.Cart;
import hsf301.fe.com.service.CartService;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
    @Override
    public Cart addProductToCart(int productId, String username) {
        return null;
    }

    @Override
    public Cart updateProductQuantity(int productId, String username) {
        return null;
    }
}
