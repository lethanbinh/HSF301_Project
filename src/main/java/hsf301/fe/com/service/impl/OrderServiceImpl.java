package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.*;
import hsf301.fe.com.repository.*;
import hsf301.fe.com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Override
    public Cart addItemToCart(int productId, String username) {
        User user = userRepository.findByUsername(username);
        Cart cart = cartRepository.findByUserUsername(username);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cart.setCreatedDate(new Date());
            cart.setTotal(0.0);
            cart = cartRepository.save(cart);
        }

        Product product = productRepository.findById(productId);
        boolean check = false;
        for (CartItem cartItem : cart.getCartItems()) {
            if (cartItem.getProduct().getId() == productId) {
                check = true;
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                cartItemRepository.save(cartItem);
                break;
            }
        }

        if (!check) {
            CartItem cartItem = new CartItem();
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cartItem.setQuantity(1);
            cartItem.setItemPrice(product.getPrice());
            cartItemRepository.save(cartItem);
        }
        updateCartTotal(cart);
        return cart;
    }

    @Override
    public Cart updateItemQuantity(int cartItemId, String username, int quantity) {
        CartItem cartItem = cartItemRepository.findById(cartItemId);
        if (quantity >= 1 && cartItem.getProduct().getStock() >= quantity) {
            cartItem.setQuantity(quantity);
            cartItemRepository.save(cartItem);
        }
        updateCartTotal(cartItem.getCart());
        return cartItem.getCart();
    }

    @Override
    public Cart removeItemFromCart(int cartItemId) {
        CartItem cartItem = cartItemRepository.findById(cartItemId);
        Cart cart = cartItem.getCart();
        cartItemRepository.delete(cartItem);
        updateCartTotal(cart);

        return cart;
    }

    @Override
    public boolean checkout(String username) {
        User user = userRepository.findByUsername(username);
        Cart cart = user.getCart();

        // Tạo order từ giỏ hàng
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(new Date());
        order.setStatus("PAID");
        order.setTotal(cart.getTotal());
        order = orderRepository.save(order);

        // Tạo order items từ cart items
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setItemPrice(cartItem.getItemPrice());
            orderItemRepository.save(orderItem);
        }

        // Xóa giỏ hàng và các cart items liên quan
        cartRepository.deleteById(cart.getId());

        return true;
    }

    @Override
    public void updateCartTotal(Cart cart) {
        List<CartItem> cartItems = cart.getCartItems();
        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getItemPrice() * item.getQuantity();
        }
        cart.setTotal(total);
        cartRepository.save(cart);
    }
}
