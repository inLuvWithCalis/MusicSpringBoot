package com.example.musicstore.controller.file;

import com.example.musicstore.domain.File;
import com.example.musicstore.domain.User;
import com.example.musicstore.repository.UserRepository;
import com.example.musicstore.service.FileService;
import com.example.musicstore.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
    , @RequestParam(defaultValue = "0", value = "page") int page
    , @RequestParam(defaultValue = "2", value = "size") int size) {

        // Setup session.
        HttpSession session = request.getSession();
        if (session.getAttribute("name") == null) {
            session.setAttribute("name", principal.getAttribute("name"));
            session.setAttribute("email", principal.getAttribute("email"));
            session.setAttribute("picture", principal.getAttribute("picture"));
        }

        // Get all files and pagination.
        User activeUser = this.userService.findByEmail(principal.getAttribute("email"));
        Page<File> files = fileService.getAllByUser(activeUser, page, size);

        // Pass list of files to the UI.
        model.addAttribute("files", files.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", files.getTotalPages());

        // Saved user to DB when they logged in success.
        this.userService.saveUser(principal);

        return "homepage/index";
    }

    @GetMapping("/auth/page")
    public String getPageIndex(Model model, HttpSession session,
                               @RequestParam("page") int page,
                               @RequestParam(defaultValue = "2", value = "size") int size) {
        String email = (String) session.getAttribute("email");
        User user = userService.findByEmail(email);
        Page<File> files = fileService.getAllByUser(user, page, size);
        model.addAttribute("files", files.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", files.getTotalPages());
        return "homepage/index";
    }

    @GetMapping("/auth/add")
    public String getAddFilePage() {
        return "manage/fileAdding";
    }

    @PostMapping("/auth/add")
    public String AddFileToDB(@RequestParam("hiddenFile") MultipartFile hiddenFile,
                              @RequestParam("shownFile") String shownFile,
                              @Valid @ModelAttribute("newFile") File file,
                              @RequestParam("name") String name,
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

        if ((name != null) || !name.isEmpty()) {
            if (!this.fileService.isFileNameUnique(name)) {
                model.addAttribute("errorName", "File name already exists!");
                return "manage/fileAdding";
            }
        }
        // save file to db.
        this.fileService.saveFileToDatabase(hiddenFile, user, name);
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

    // Search files
    @PostMapping("/auth/search")
    public String searchFile(Model model, @RequestParam("keyword") String name, HttpSession session) {
        // get session.
        String email = (String) session.getAttribute("email");
        Page<File> files = fileService.fetchAllByUser(userService.findByEmail(email), 0, 2, name);
        model.addAttribute("files", files.getContent());
        model.addAttribute("currentPage", 0);
        model.addAttribute("totalPages", files.getTotalPages());
        return "homepage/index";
    }
}
