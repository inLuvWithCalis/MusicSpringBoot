package com.example.musicstore.service;

import com.example.musicstore.domain.File;
import com.example.musicstore.domain.File_;
import com.example.musicstore.domain.User;
import com.example.musicstore.repository.FileRepository;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
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

    public void deleteFilePathById(long id) {
        File existingFile = this.fileRepository.findById(id).orElse(null);
        Path oldFilePath = Paths.get("src/main/resources/static" + existingFile.getPath()).toAbsolutePath();
        try {
            Files.deleteIfExists(oldFilePath);
        } catch (IOException e) {
            throw new RuntimeException("Making error while deleting file: " + e.getMessage());
        }
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
                existingFile.setPath("/upload/" + updatedFileName);
            } else {
                // Remain the same file name if user just renames the file.
                updatedFileName = newName;
            }

            // Update DB.
            existingFile.setName(updatedFileName);
            existingFile.setCreatedAt(new Date());
            fileRepository.save(existingFile);
        } catch (IOException e) {
            throw new RuntimeException("Making error while updating file: " + e.getMessage());
        }
    }


    public void saveFileToDatabase(MultipartFile file, User user, String changedFileName) {
        try {
            Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            File fileToSave = new File();
            if (changedFileName == null || changedFileName.isEmpty()) {
                fileToSave.setName(fileName);
            } else {
                fileToSave.setName(changedFileName);
            }
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

    public boolean isFileNameUnique(String fileName) {
        return this.fileRepository.findFileByName(fileName).isEmpty();
    }

    // Page processing.
    public Page<File> getAllByUser(User user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return this.fileRepository.findAllFilesByUser(user, pageable);
    }

    private Specification<File> getFileNameSpecification(String name, User user, String sortOrder) {
        return (root, query, cb) -> {
            assert query != null;
            Predicate predicate = cb.and(
                    cb.like(root.get(File_.NAME), "%" + name + "%"),
                    cb.equal(root.get(File_.USER), user)
            );
            query.orderBy(sortOrder.equals("asc") ? cb.asc(root.get(File_.CREATED_AT)) : cb.desc(root.get(File_.CREATED_AT)));
            return predicate;
        };
    }

    private Specification<File> getFileSpecificationSorting(User user, String sortOrder) {
        return (root, query, cb) -> {
            assert query != null;
            query.orderBy(sortOrder.equals("asc") ? cb.asc(root.get(File_.CREATED_AT)) : cb.desc(root.get(File_.CREATED_AT)));
            return cb.equal(root.get(File_.USER), user);
        };
    }

    private Specification<File> getFileSpecificationTypeFilter(User user, String type, String sortOrder) {
        return (root, query, cb) -> {
            assert query != null;
            Predicate predicate = cb.and(
                    cb.like(root.get(File_.TYPE), "%" + type + "%"),
                    cb.equal(root.get(File_.USER), user)
            );
            query.orderBy(sortOrder.equals("asc") ? cb.asc(root.get(File_.CREATED_AT)) : cb.desc(root.get(File_.CREATED_AT)));
            return predicate;
        };
    }

    private Specification<File> getFileSpecificationTypeAndNameFilter(User user, String type, String name, String sortOrder) {
        return (root, query, cb) -> {
            assert query != null;
            Predicate predicate = cb.and(
                    cb.like(root.get(File_.NAME), "%" + name + "%"),
                    cb.equal(root.get(File_.USER), user),
                    cb.like(root.get(File_.TYPE), "%" + type + "%")
            );
            query.orderBy(sortOrder.equals("asc") ? cb.asc(root.get(File_.CREATED_AT)) : cb.desc(root.get(File_.CREATED_AT)));
            return predicate;
        };
    }

    public Page<File> getFilteredFiles(User user, int page, int size, String searchName, String sortOrder,
                                       String fileType) {
        Pageable pageable = PageRequest.of(page, size, sortOrder.equals("asc") ?
                Sort.by("createdAt").ascending() : Sort.by("createdAt").descending());
        if (searchName != null && fileType != null) {
            return this.fileRepository.findAll(getFileSpecificationTypeAndNameFilter(user, fileType, searchName, sortOrder), pageable);
        } else if (searchName != null) {
            return this.fileRepository.findAll(getFileNameSpecification(searchName, user, sortOrder), pageable);
        } else if (fileType != null) {
            return this.fileRepository.findAll(getFileSpecificationTypeFilter(user, fileType, sortOrder), pageable);
        } else {
            return this.fileRepository.findAll(getFileSpecificationSorting(user, sortOrder), pageable);
        }
    }
}