package hsf301.fe.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

    @GetMapping("/manage-order")
    public String order () {
        return "manage-order";
    }
}
