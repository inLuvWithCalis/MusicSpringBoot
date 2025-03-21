package com.example.musicstore.service;

import com.example.musicstore.domain.Album;
import com.example.musicstore.repository.AlbumRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlbumService {
    private final AlbumRepository albumRepository;

    public AlbumService(AlbumRepository albumRepository) {
        this.albumRepository = albumRepository;
    }

    public List<Album> findAllAlbums() {
        return albumRepository.findAll();
    }

    public Album findAlbumByTitle(String title) {
        return albumRepository.findByTitle(title);
    }

    public void saveAlbum(Album album) {
        albumRepository.save(album);
    }

    public Album findAlbumById(long id) {
        return albumRepository.findAlbumById(id);
    }
}
