package com.example.musicstore.domain;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "artists")
public class Artist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String bio;

    private String imageUrl;
    private Date createdAt;

    @OneToMany(mappedBy = "artist")
    private List<Album> albums;

    @OneToMany(mappedBy = "artist")
    private List<Song> songs;



    // Constructors
    public Artist() {}

    public Artist(String name, String bio, String imageUrl, Date createdAt) {
        this.name = name;
        this.bio = bio;
        this.imageUrl = imageUrl;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "Artist{id=" + id + ", name='" + name + "', bio='" + bio + "', imageUrl='" + imageUrl + "', createdAt=" + createdAt + "}";
    }
}
