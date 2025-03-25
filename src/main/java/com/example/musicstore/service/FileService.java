package com.example.musicstore.service;

import com.example.musicstore.repository.FileRepository;
import org.springframework.stereotype.Service;

@Service
public class FileService {
    private final FileRepository fileRepository;

    public FileService(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }
}
