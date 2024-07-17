package hsf301.fe.com.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "users")
@Data
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "avatar", columnDefinition = "TEXT")
    private String avatar;

    @Column(name = "role")
    private String role;

    @OneToMany(mappedBy = "user")
    private List<Order> orders;

    @Column(name = "status", nullable = false)
    private boolean status = true;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Cart cart;

    // Getters and setters
}