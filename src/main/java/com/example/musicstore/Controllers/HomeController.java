package com.example.musicstore.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"", "/"})
    public String home() {
        return "home";
    }

    @GetMapping("/user")
    public String userPage() {
        return "user";
    }
}
