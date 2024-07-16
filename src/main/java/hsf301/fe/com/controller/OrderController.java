package hsf301.fe.com.controller;

import hsf301.fe.com.pojo.User;
import hsf301.fe.com.response.UserOrderResponseDTO;
import hsf301.fe.com.service.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/manage-order")
    public ModelAndView order (HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User user = (User) session.getAttribute("USER");
        List<UserOrderResponseDTO> list = orderService.getUserOrder(user);
        mv.addObject("listUserOrder", list);
        mv.setViewName("manage-order");
        return mv;
    }

}
