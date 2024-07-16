package hsf301.fe.com.service;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.request.ProfileDTO;


public interface ProfileService {
    User updateProfile(ProfileDTO profileDTO);
}
