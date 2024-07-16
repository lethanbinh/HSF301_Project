package hsf301.fe.com.controller;

import hsf301.fe.com.dto.ProfileDTO;
import hsf301.fe.com.pojo.User;
import hsf301.fe.com.service.ProfileService;
import hsf301.fe.com.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequiredArgsConstructor
public class ProfileController {

    private final ProfileService profileService;

    @GetMapping("/manage-profile")
    public ModelAndView manageProfile (HttpSession session) {
        ModelAndView mav = new ModelAndView();
        User user = (User) session.getAttribute("USER");
        if (user == null){
            System.out.println("user is null");
        }
        mav.addObject("user", user);
        mav.setViewName("manage-profile");
        return mav;
    }

    @PostMapping("profile/update")
    public ModelAndView updateProfile(@ModelAttribute ProfileDTO profileDTO, HttpSession session){
        ModelAndView mav = new ModelAndView();
        User user = new User();
        try {
            user = profileService.updateProfile(profileDTO);
        } catch (Exception e){
            e.printStackTrace();
        }
        session.setAttribute("USER", user);
        mav.setViewName("redirect:/manage-profile");
        return mav;
    }
}