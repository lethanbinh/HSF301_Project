package hsf301.fe.com.service;

import hsf301.fe.com.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    User findByUsername (String username);
}
