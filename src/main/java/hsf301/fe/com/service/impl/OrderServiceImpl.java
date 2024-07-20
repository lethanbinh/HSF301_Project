package hsf301.fe.com.service.impl;

import hsf301.fe.com.dto.ItemDetailResponseDTO;
import hsf301.fe.com.dto.UserOrderResponseDTO;
import hsf301.fe.com.pojo.*;
import hsf301.fe.com.repository.*;
import hsf301.fe.com.service.OrderService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Transactional
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
    @Transactional
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
    @Transactional
    public boolean createOrder(String username) {
        User user = userRepository.findByUsername(username);
        Cart cart = user.getCart();

        updateCartTotal(cart);
        // Create order from cart
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(new Date());
        order.setStatus("PAID");
        order.setTotal(cart.getTotal());
        order = orderRepository.save(order);

        // Create order items from cart items
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setItemPrice(cartItem.getItemPrice());
            orderItemRepository.save(orderItem);

            Product product = orderItem.getProduct();
            if (product.getStock() >= orderItem.getQuantity()) {
                product.setStock(product.getStock() - orderItem.getQuantity());
            }
            productRepository.saveAndFlush(product);
        }

        // Clear the cart
        cartItemRepository.deleteAll(cart.getCartItems());
        cart.getCartItems().clear();
        cartRepository.delete(cart);

        return true;
    }

    @Override
    @Transactional
    public void updateCartTotal(Cart cart) {
        List<CartItem> cartItems = cart.getCartItems();
        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getItemPrice() * item.getQuantity();
        }
        cart.setTotal(total);
        cartRepository.save(cart);
    }

    @Override
    @Transactional
    public void removeAllItemsFromCart(Cart cart) {
        for (CartItem cartItem : cart.getCartItems()) {
            cartItemRepository.delete(cartItem);
        }
        cart.getCartItems().clear();
        cartRepository.saveAndFlush(cart);
    }

    @Override
    public int getTotalItemsInCart(String username) {
        Cart cart = cartRepository.findByUserUsername(username);
        if (cart != null && cart.getCartItems() != null) {
            return cart.getCartItems().size();
        }
        return 0;
    }

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
