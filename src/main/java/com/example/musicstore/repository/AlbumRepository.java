package com.example.musicstore.repository;

import com.example.musicstore.domain.Album;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlbumRepository extends JpaRepository<Album, Long> {
    Album findAlbumByTitle(String title);

    Album findByTitle(String title);

    Album findAlbumById(Long id);
}
