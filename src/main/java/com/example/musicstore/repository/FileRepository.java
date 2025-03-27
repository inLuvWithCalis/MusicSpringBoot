package com.example.musicstore.repository;

import com.example.musicstore.domain.File;
import com.example.musicstore.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface FileRepository extends JpaRepository<File, Long> {
    Page<File> findAllFilesByUser(User user, Pageable pageable);

    Optional<File> findFileByName(String fileName);
}
