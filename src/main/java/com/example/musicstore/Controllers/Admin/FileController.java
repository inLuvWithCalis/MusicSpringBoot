package com.example.musicstore.Controllers.Admin;

import com.example.musicstore.domain.File;
import com.example.musicstore.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class FileController {

    private final FileService fileService;

    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    @GetMapping({"/home", ""})
    public String getHome(Model model) {
        List<File> files = fileService.getAllFiles();
        model.addAttribute("files", files);
        return "homepage/index";
    }

    @GetMapping("/auth/add")
    public String getAddFilePage(Model model) {
        return "manage/fileAdding";
    }

    @PostMapping("/auth/add")
    public String AddFileToDB(@RequestParam("hiddenFile") MultipartFile hiddenFile,
                              @RequestParam("shownFile") String shownFile,
                              @ModelAttribute("newFile") File file,
                              @RequestParam("submitTime") String submitTime,
                              Model model) {
        return null;
    }
}
