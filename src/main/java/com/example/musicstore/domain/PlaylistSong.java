package com.example.musicstore.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "playlist_songs")
public class PlaylistSong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "playlist_id")
    private Playlist playlist;

    @ManyToOne
    @JoinColumn(name = "song_id")
    private Song song;
}
