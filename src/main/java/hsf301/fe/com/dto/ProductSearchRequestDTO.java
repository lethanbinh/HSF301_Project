package hsf301.fe.com.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductSearchRequestDTO {
    private String productName;
    private String sortCriteria;
    private Long priceTo;
    private String categories;
}
