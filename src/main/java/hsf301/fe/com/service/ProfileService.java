package hsf301.fe.com.service;

import hsf301.fe.com.dto.ProfileDTO;
import hsf301.fe.com.pojo.User;
import org.springframework.stereotype.Service;


public interface ProfileService {
    User updateProfile(ProfileDTO profileDTO);
}
