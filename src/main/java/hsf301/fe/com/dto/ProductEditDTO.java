package hsf301.fe.com.dto;

import lombok.Data;

@Data
public class ProductEditDTO {
    private Long id;
    private String category;
    private String description;
    private String imageUrl;
    private String name;
    private Double price;
    private Long stock;
}
