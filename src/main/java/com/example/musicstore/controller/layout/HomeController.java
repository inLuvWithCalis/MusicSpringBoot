package com.example.musicstore.controller.layout;

import com.example.musicstore.domain.File;
import com.example.musicstore.service.FileService;
import com.example.musicstore.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;

@Controller
public class HomeController {

    private final FileService fileService;

    public HomeController(FileService fileService) {
        this.fileService = fileService;
    }

    @GetMapping("/auth/delete")
    public String getDeletedList(@RequestParam("id") long id) {
        this.fileService.removeFileById(id);
        return "redirect:/home";
    }

    @GetMapping("/auth/edit")
    public String getEditForm(Model model, @RequestParam("id") long id) {
        File editingFile = this.fileService.getFileById(id);

        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = outputFormat.format(editingFile.getCreatedAt());
        model.addAttribute("editingFile", editingFile);
        model.addAttribute("formattedCreatedAt", formattedDate);
        return "manage/fileEditing";
    }

    @PostMapping("/auth/edit")
    public String editFile(@RequestParam("id") long id,
                           @RequestParam("name") String name,
                           @RequestParam("hiddenFile") MultipartFile hiddenFile) {
        File editedFile = this.fileService.getFileById(id);
        this.fileService.updateFile(id, name, hiddenFile);
        return "redirect:/home";
    }
}
