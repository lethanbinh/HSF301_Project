package hsf301.fe.com.service;

import hsf301.fe.com.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    User findByUsername (String username);

    List<User> findAll();
}
