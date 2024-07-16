package hsf301.fe.com.request;


import lombok.Data;

@Data
public class ProfileDTO {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String address;
}
