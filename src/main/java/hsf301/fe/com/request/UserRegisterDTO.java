package hsf301.fe.com.request;


import lombok.Data;

@Data
public class UserRegisterDTO {
    private String username;
    private String email;
    private String phone;
    private String password;
    private String confirmPassword;
}
