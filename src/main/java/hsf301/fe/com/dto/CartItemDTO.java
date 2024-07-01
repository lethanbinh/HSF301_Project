package hsf301.fe.com.dto;

import lombok.Data;

@Data
public class CartItemDTO {
    private int id;
    private int productId;
    private String productName;
    private String imageUrl;
    private int quantity;
    private double itemPrice;
}
