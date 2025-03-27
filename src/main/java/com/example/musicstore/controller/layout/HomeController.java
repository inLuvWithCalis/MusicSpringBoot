package com.example.musicstore.controller.layout;

import com.example.musicstore.domain.File;
import com.example.musicstore.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
        this.fileService.deleteFilePathById(id);
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
                           Model model,
                           @RequestParam("hiddenFile") MultipartFile hiddenFile) {

        File editingFile = fileService.getFileById(id);
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = outputFormat.format(editingFile.getCreatedAt());
        model.addAttribute("editingFile", editingFile);
        model.addAttribute("formattedCreatedAt", formattedDate);

        if (name == null || name.isEmpty()) {
            model.addAttribute("errorName", "File name is empty!");
            return "manage/fileEditing";
        }

        if (!fileService.isFileNameUnique(name)) {
            model.addAttribute("errorName", "File name already exists!");
            return "manage/fileEditing";
        }

        fileService.updateFile(id, name, hiddenFile);
        return "redirect:/home";
    }

    // Detail page
    @GetMapping("/auth/detail/{id}")
    public String getDetailPage(@PathVariable("id") long id, Model model) {
        File file = this.fileService.getFileById(id);

        // format date
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = outputFormat.format(file.getCreatedAt());

        // add attributes to model
        model.addAttribute("file", file);
        model.addAttribute("formattedCreatedAt", formattedDate);
        return "manage/fileDetail";
    }
}
