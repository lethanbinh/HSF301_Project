package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.UserRepository;
import hsf301.fe.com.request.UserDTO;
import hsf301.fe.com.request.UserRegisterDTO;
import hsf301.fe.com.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByUsernameAndPassword(UserDTO userDTO) {
        return userRepository.findByEmailAndPassword(userDTO.getEmail(), userDTO.getPassword());
    }

    @Override
    public String registerUser(UserRegisterDTO userRegisterDTO) {
        if (!userRegisterDTO.getPassword().equals(userRegisterDTO.getConfirmPassword())) {
            return "Passwords do not match";
        }

        if (validateRegisterUser(userRegisterDTO)) {
            return "User already exists with provided email, username or phone";
        }

        User user = new User();
        user.setEmail(userRegisterDTO.getEmail());
        user.setPassword(userRegisterDTO.getPassword());
        user.setUsername(userRegisterDTO.getUsername());
        user.setPhone(userRegisterDTO.getPhone());
        user.setRole("USER");
        userRepository.save(user);

        return "success";
    }

    private boolean validateRegisterUser(UserRegisterDTO userRegisterDTO) {
        String email = userRegisterDTO.getEmail();
        String username = userRegisterDTO.getUsername();
        String phone = userRegisterDTO.getPhone();
        long count = userRepository.countByEmailOrUsernameOrPhone(email, username, phone);
        return count > 0;
    }


    @Override
    public List<User> listAllUser() {
        return userRepository.listAllUser();
    }
}
