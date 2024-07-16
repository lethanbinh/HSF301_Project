package hsf301.fe.com.service.impl;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.repository.UserRepository;
import hsf301.fe.com.request.ProfileDTO;
import hsf301.fe.com.service.ProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProfileServiceImpl implements ProfileService {

    private final UserRepository userRepository;

    @Override
    public User updateProfile(ProfileDTO profileDTO) {
        User existedUser = userRepository.findById(profileDTO.getId());
        existedUser.setPhone(profileDTO.getPhone());
        existedUser.setEmail(profileDTO.getEmail());
        existedUser.setAddress(profileDTO.getAddress());
        existedUser.setUsername(profileDTO.getName());
        userRepository.save(existedUser);
        return existedUser;
    }
}
