package hsf301.fe.com.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductSearchRequestDTO {
    private String name;
    private String sort;
    private Long range;
    private List<String> categoryList;
}
