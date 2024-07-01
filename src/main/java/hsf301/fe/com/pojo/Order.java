package hsf301.fe.com.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
public class Order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "orderDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;

    @Column(name = "status")
    private String status;

    @Column(name = "total")
    private double total;

    @OneToMany(mappedBy = "order")
    private List<OrderItem> orderItems;

    // Getters and setters
}