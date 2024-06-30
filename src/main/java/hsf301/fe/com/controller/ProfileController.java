package hsf301.fe.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @GetMapping("/manage-profile")
    public String manageProfile () {
        return "manage-profile";
    }
}
