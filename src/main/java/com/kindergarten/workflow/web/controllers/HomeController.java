package com.kindergarten.workflow.web.controllers;

import com.kindergarten.workflow.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class HomeController {

    @GetMapping
    public String main(@AuthenticationPrincipal User user,  Map<String, Object> model) {
        model.put("user", user);
        return "main";
    }

    @GetMapping("/main")
    public String main2(@AuthenticationPrincipal User user,  Map<String, Object> model) {
        model.put("user", user);
        return "main";
    }
}
