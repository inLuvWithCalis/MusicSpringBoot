package com.example.musicstore.domain;

import jakarta.persistence.*;

import javax.sound.midi.Track;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "songs")
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private int duration;
    private String fileUrl;
    private Date createdAt;

    // Album Entity.
    @ManyToOne
    @JoinColumn(name = "album_id")
    private Album album;

    // Artist Entity.
    @ManyToOne
    @JoinColumn(name = "artist_id")
    private Artist artist;

    // Playlist_Song Entity.
    @OneToMany(mappedBy = "song")
    private List<PlaylistSong> playlistSongs;


    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getFileUrl() { return fileUrl; }
    public void setFileUrl(String fileUrl) { this.fileUrl = fileUrl; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "Song{id=" + id + ", title='" + title + "', duration=" + duration +
                ", fileUrl='" + fileUrl + "', createdAt=" + createdAt + '}';
    }
}
