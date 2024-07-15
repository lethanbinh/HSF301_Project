package hsf301.fe.com.service;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.request.UserDTO;
import hsf301.fe.com.request.UserRegisterDTO;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    User findByUsername (String username);
    User findByUsernameAndPassword(UserDTO userDTO);
    String registerUser(UserRegisterDTO userRegisterDTO);
}
