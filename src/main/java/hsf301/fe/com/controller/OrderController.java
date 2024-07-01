package hsf301.fe.com.controller;

import hsf301.fe.com.dto.CartItemDTO;
import hsf301.fe.com.dto.CartItemMapper;
import hsf301.fe.com.pojo.Cart;
import hsf301.fe.com.pojo.CartItem;
import hsf301.fe.com.repository.CartItemRepository;
import hsf301.fe.com.repository.CartRepository;
import hsf301.fe.com.service.OrderService;
import hsf301.fe.com.service.ProductService;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/cart")
    public String cart(Model model, HttpServletRequest request) {
        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        List<CartItem> cartItems = cartRepository.findByUserUsername(username).getCartItems();
        List<CartItemDTO> cartItemDTOs = CartItemMapper.toDTOs(cartItems);
        session.setAttribute("CART", cartItemDTOs);

        double total = calculateTotal(cartItemDTOs);
        session.setAttribute("CART_TOTAL", total);

        return "cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model, HttpServletRequest request) {
        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        List<CartItem> cartItems = cartRepository.findByUserUsername(username).getCartItems();
        List<CartItemDTO> cartItemDTOs = CartItemMapper.toDTOs(cartItems);
        session.setAttribute("CART", cartItemDTOs);

        double total = calculateTotal(cartItemDTOs);
        session.setAttribute("CART_TOTAL", total);

        return "checkout";
    }

    @GetMapping("/manage-order")
    public String order() {
        return "manage-order";
    }

    @PostMapping("/cart/add-item")
    public String addItemToCart(Model model, HttpServletRequest request) throws Exception {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String username = request.getParameter("username");

            if (productService.findById(productId) != null) {
                Cart cart = orderService.addItemToCart(productId, username);
                if (cart != null) {
                    HttpSession session = request.getSession();
                    List<CartItemDTO> cartItemDTOs = CartItemMapper.toDTOs(cart.getCartItems());
                    session.setAttribute("CART", cartItemDTOs);

                    double total = calculateTotal(cartItemDTOs);
                    session.setAttribute("CART_TOTAL", total);

                    request.setAttribute("SUCCESS_MESSAGE", "Product added to cart successfully.");
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Cannot add product to cart.");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Product not found.");
            }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "An error occurred while adding product to cart: " + e.getMessage());
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/cart/update-item")
    public String updateItemQuantity(Model model, HttpServletRequest request) throws Exception {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItem"));
            String username = request.getParameter("username");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (cartItemRepository.findById(cartItemId) != null) {
                Cart cart = orderService.updateItemQuantity(cartItemId, username, quantity);
                if (cart != null) {
                    HttpSession session = request.getSession();
                    List<CartItemDTO> cartItemDTOs = CartItemMapper.toDTOs(cart.getCartItems());
                    session.setAttribute("CART", cartItemDTOs);

                    double total = calculateTotal(cartItemDTOs);
                    session.setAttribute("CART_TOTAL", total);

                    request.setAttribute("SUCCESS_MESSAGE", "Product quantity updated successfully.");
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Cannot update product quantity.");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Cart item not found.");
            }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "An error occurred while updating product quantity: " + e.getMessage());
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/cart/delete-item")
    public String removeItemFromCart(Model model, HttpServletRequest request) throws Exception {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItem"));

            if (cartItemRepository.findById(cartItemId) != null) {
                Cart cart = orderService.removeItemFromCart(cartItemId);
                if (cart != null) {
                    HttpSession session = request.getSession();
                    List<CartItemDTO> cartItemDTOs = CartItemMapper.toDTOs(cart.getCartItems());
                    session.setAttribute("CART", cartItemDTOs);

                    double total = calculateTotal(cartItemDTOs);
                    session.setAttribute("CART_TOTAL", total);

                    request.setAttribute("SUCCESS_MESSAGE", "Product removed from cart successfully.");
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Cannot remove product from cart.");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Cart item not found.");
            }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "An error occurred while removing product from cart: " + e.getMessage());
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/checkout/payment")
    public String payment(Model model, HttpServletRequest request) throws Exception {
        try {
            String username = request.getParameter("username");

            if (userService.findByUsername(username) != null) {
                boolean orderStatus = orderService.checkout(username);
                if (orderStatus) {
                    HttpSession session = request.getSession();
                    session.removeAttribute("CART");
                    session.removeAttribute("CART_TOTAL");
                    request.setAttribute("SUCCESS_MESSAGE", "Order placed successfully.");
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Cannot complete checkout.");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "User not found.");
            }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "An error occurred during checkout: " + e.getMessage());
        }
        return "redirect:" + request.getHeader("Referer");
    }

    private double calculateTotal(List<CartItemDTO> cartItems) {
        return cartItems.stream().mapToDouble(item -> item.getItemPrice() * item.getQuantity()).sum();
    }
}
