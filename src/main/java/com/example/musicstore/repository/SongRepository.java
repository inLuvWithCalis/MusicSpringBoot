package com.example.musicstore.repository;

import com.example.musicstore.domain.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {

    Song findSongById(Long id);
}
