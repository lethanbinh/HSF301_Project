package hsf301.fe.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {

    @GetMapping("/manage-account")
    public String manageAccount () {
        return "manage-account";
    }
}
