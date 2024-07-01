package hsf301.fe.com.dto;

import hsf301.fe.com.pojo.CartItem;

import java.util.List;
import java.util.stream.Collectors;

public class CartItemMapper {
    public static CartItemDTO toDTO(CartItem cartItem) {
        CartItemDTO dto = new CartItemDTO();
        dto.setId(cartItem.getId());
        dto.setProductId(cartItem.getProduct().getId());
        dto.setProductName(cartItem.getProduct().getName());
        dto.setImageUrl(cartItem.getProduct().getImageUrl());
        dto.setQuantity(cartItem.getQuantity());
        dto.setItemPrice(cartItem.getItemPrice());
        return dto;
    }

    public static List<CartItemDTO> toDTOs(List<CartItem> cartItems) {
        return cartItems.stream().map(CartItemMapper::toDTO).collect(Collectors.toList());
    }
}
