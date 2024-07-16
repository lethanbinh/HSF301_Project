package hsf301.fe.com.converter;

import hsf301.fe.com.dto.AccountEditDTO;
import hsf301.fe.com.dto.ProductEditDTO;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.UserRepository;

public class AccountConverter {
    private static UserRepository userRepository;
    public static User toUser(AccountEditDTO accountEditDTO){
        User user = new User();
        if(accountEditDTO.getId() != null){
            int id = Math.toIntExact(accountEditDTO.getId());
            user.setId(id);
            User oldUser = userRepository.findById(id);
            user.setPassword(oldUser.getPassword());
        }else{
            user.setPassword(accountEditDTO.getPassword());
        }
        user.setAddress(accountEditDTO.getAddress());
        user.setEmail(accountEditDTO.getEmail());
        user.setAvatar(accountEditDTO.getAvatar());
        user.setPhone(accountEditDTO.getPhone());
        user.setUsername(accountEditDTO.getUserName());
        user.setRole("USER");
        if(accountEditDTO.getStatus().equals("Active")){
            user.setStatus(true);
        }else{
            user.setStatus(false);
        }
        return user;
    }
}
