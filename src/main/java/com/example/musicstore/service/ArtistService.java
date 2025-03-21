package com.example.musicstore.service;

import com.example.musicstore.domain.Artist;
import com.example.musicstore.repository.ArtistRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArtistService {
    private final ArtistRepository artistRepository;

    public ArtistService(ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    public List<Artist> findAllArtists() {
        return artistRepository.findAll();
    }

    public Artist findArtistByName(String name) {
        return artistRepository.findByName(name);
    }

    public Artist findArtistByID(long id) {
        return artistRepository.findArtistById(id);
    }

    public void saveArtist(Artist artist) {
        artistRepository.save(artist);
    }
}
