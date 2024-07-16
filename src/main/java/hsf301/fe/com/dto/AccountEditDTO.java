package hsf301.fe.com.dto;

import lombok.Data;

@Data
public class AccountEditDTO {
    private Long id;
    private String status;
    private String address;
    private String avatar;
    private String email;
    private String password;
    private String phone;
    private String role;
    private String userName;
}