package com.example.musicstore.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SongController {
    @GetMapping("/admin/song")
    public String getSongManagement(Model model) {
        return "admin/songManage";
    }

    @GetMapping("/admin/add")
    public String getSongCreationForm(Model model) {
        return "admin/songAdding";
    }
}