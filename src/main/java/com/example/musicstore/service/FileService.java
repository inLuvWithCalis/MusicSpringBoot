package com.example.musicstore.service;

import com.example.musicstore.domain.File;
import com.example.musicstore.domain.User;
import com.example.musicstore.repository.FileRepository;
import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FileService {
    private final FileRepository fileRepository;
    private static final String UPLOAD_DIRECTORY = "src/main/resources/static/upload/";

    public FileService(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }

    public List<File> getAllFilesByUser(User user) {
        return this.fileRepository.findAll().stream().filter(f
                -> f.getUser().equals(user)).collect(Collectors.toList());
    }

    public List<File> getAllFiles() {
        return fileRepository.findAll();
    }

    public void updateFile(long id, String newName, MultipartFile newFile) {
        File existingFile = this.fileRepository.findById(id).orElse(null);

        Path oldFilePath = Paths.get("src/main/resources/static" + existingFile.getPath()).toAbsolutePath();
        Path uploadPath = Paths.get(UPLOAD_DIRECTORY);

        String updatedFileName;
        Path newFilePath;

        try {
            // if user uploads a new file.
            if (newFile != null && !newFile.isEmpty()) {
                // Delete old file.
                Files.deleteIfExists(oldFilePath);

                // Save new file with new name.
                updatedFileName = System.currentTimeMillis() + "-" + newFile.getOriginalFilename();
                newFilePath = uploadPath.resolve(updatedFileName);
                Files.copy(newFile.getInputStream(), newFilePath, StandardCopyOption.REPLACE_EXISTING);

                // Set up the file TYPE.
                existingFile.setType(newFile.getContentType());
            } else {
                // Remain the same file name if user just renames the file.
                String fileExtension = existingFile.getName().substring(existingFile.getName().lastIndexOf("."));
                updatedFileName = newName + fileExtension;
                newFilePath = oldFilePath.getParent().resolve(updatedFileName);

                // rename the file.
                Files.move(oldFilePath, newFilePath, StandardCopyOption.REPLACE_EXISTING);
            }

            // Update DB.
            existingFile.setName(updatedFileName);
            existingFile.setPath("/upload/" + updatedFileName);
            existingFile.setCreatedAt(new Date());
            fileRepository.save(existingFile);
        } catch (IOException e) {
            throw new RuntimeException("Making error while updating file: " + e.getMessage());
        }
    }


    public void saveFileToDatabase(MultipartFile file, User user) {
        try {
            Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            File fileToSave = new File();
            fileToSave.setName(fileName);
            fileToSave.setPath("/upload/" + fileName);
            fileToSave.setType(file.getContentType());
            fileToSave.setCreatedAt(new Date());
            fileToSave.setUser(user);

            fileRepository.save(fileToSave);

        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Making error while saving file: " + e.getMessage());
        }
    }

    public void removeFileById(long id) {
        this.fileRepository.deleteById(id);
    }

    public File getFileById(long id) {
        return this.fileRepository.findById(id).orElse(null);
    }
}