package hsf301.fe.com.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserOrderResponseDTO {
    private int orderId;
    private String name;
    private String orderDate;
    private String totalAmount;
    private String status;
    private List<ItemDetailResponseDTO> listItemDetail;
}
