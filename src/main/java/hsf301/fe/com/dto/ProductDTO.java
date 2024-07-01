package hsf301.fe.com.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class ProductDTO {

    @NotEmpty(message = "Name is required")
    private String name;

    @NotEmpty(message = "Description is required")
    private String description;

    @Min(value = 0, message = "Price can not smaller than zero")
    private double price;

    @NotEmpty(message = "Category is required")
    private String category;

    @Min(value = 1, message = "Quantity in stock must bigger than zero")
    private int stock;

    private MultipartFile imageUrl;

}
