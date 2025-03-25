package com.example.musicstore.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String getCustomLoginPage() {
        return "auth/login";
    }
}
