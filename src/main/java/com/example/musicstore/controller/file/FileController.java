package com.example.musicstore.controller.file;

import com.example.musicstore.domain.File;
import com.example.musicstore.domain.User;
import com.example.musicstore.repository.UserRepository;
import com.example.musicstore.service.FileService;
import com.example.musicstore.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class FileController {

    private final FileService fileService;
    private final UserService userService;

    public FileController(FileService fileService, UserService userService) {
        this.fileService = fileService;
        this.userService = userService;
    }

    @GetMapping({"/home", "/"})
    public String getHome(Model model, @AuthenticationPrincipal OAuth2User principal, HttpServletRequest request
            ) {

        // Setup session.
        HttpSession session = request.getSession();
        if (session.getAttribute("name") == null) {
            session.setAttribute("name", principal.getAttribute("name"));
            session.setAttribute("email", principal.getAttribute("email"));
            session.setAttribute("picture", principal.getAttribute("picture"));
        }

        // Get all files.
        User activeUser = this.userService.findByEmail(principal.getAttribute("email"));
        List<File> files = fileService.getAllFilesByUser(activeUser);
        model.addAttribute("files", files);

        // Saved user to DB when they logged in success.
        this.userService.saveUser(principal);

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
                              @RequestParam("name") String changedFileName,
                              Model model,
                              HttpSession session) {
        // get session.
        String email = (String) session.getAttribute("email");

        // get object user.
        User user = userService.findByEmail(email);

        // check if file already filed.
        if (hiddenFile == null || hiddenFile.isEmpty()) {
            model.addAttribute("error", "File is empty, please select a file!");
            return "manage/fileAdding";
        }

        // save file to db.
        this.fileService.saveFileToDatabase(hiddenFile, user, changedFileName);
        return "redirect:/home";
    }

    // download file
    @GetMapping("/auth/download/{id}")
    public ResponseEntity<Resource> downloadFile(@PathVariable("id") long id, HttpServletResponse response) throws IOException {
        File file = this.fileService.getFileById(id);

        // get file path
        Path filePath = Paths.get("src/main/resources/static" + file.getPath()).toAbsolutePath();

        // create resource url
        Resource resource = new FileSystemResource(filePath.toString());
        if (!resource.exists()) {
            throw new RuntimeException("File not found: " + filePath.toString());
        }

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
}
