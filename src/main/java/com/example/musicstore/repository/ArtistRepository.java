package com.example.musicstore.repository;

import com.example.musicstore.domain.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistRepository extends JpaRepository<Artist, Long> {

    Artist findByName(String name);

    Artist findArtistById(Long id);
}
