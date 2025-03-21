package com.example.musicstore.service;

import com.example.musicstore.domain.Song;
import com.example.musicstore.repository.SongRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongService {
    private final SongRepository songRepository;

    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }

    public List<Song> findAllSongs() {
        return songRepository.findAll();
    }

    public void Save(Song song) {
        songRepository.save(song);
    }

    public void deleteSongByID(long id) {
        this.songRepository.deleteById(id);
    }

    public Song findSongByID(long id) {
        return songRepository.findSongById(id);
    }
}
