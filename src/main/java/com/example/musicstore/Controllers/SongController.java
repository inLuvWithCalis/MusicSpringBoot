package com.example.musicstore.Controllers;

import com.example.musicstore.domain.Song;
import com.example.musicstore.service.AlbumService;
import com.example.musicstore.service.ArtistService;
import com.example.musicstore.service.SongService;
import com.example.musicstore.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class SongController {
    private final UploadService uploadService;
    private final ArtistService artistService;

    private final AlbumService albumService;
    private final SongService songService;

    public SongController(UploadService uploadService, ArtistService artistService, AlbumService albumService, SongService songService) {
        this.uploadService = uploadService;
        this.artistService = artistService;
        this.albumService = albumService;
        this.songService = songService;
    }

    @GetMapping("/admin/song")
    public String getSongManagement(Model model) {
        return "admin/songManage";
    }

    @GetMapping("/admin/add")
    public String getSongCreationForm(Model model) {
        model.addAttribute("newSong", new Song());
        model.addAttribute("artists", artistService.findAllArtists());
        model.addAttribute("albums", albumService.findAllAlbums());
        return "admin/songAdding";
    }

    @PostMapping(value ="/admin/add")
    public String getSongData(Model model, @ModelAttribute("newSong") Song song,
                              @RequestParam("songFile")MultipartFile file,
                              @RequestParam("artistId") Long artistId,
                              @RequestParam("albumId") Long albumId) {
        String audio = this.uploadService.handleSaveUploadFile(file);

        // Save to database.

        song.setArtist(artistService.findArtistByID(artistId));
        song.setAlbum(albumService.findAlbumById(albumId));
        song.setFileUrl(audio);
        song.setTitle(song.getTitle());

        songService.Save(song);
        return "redirect:/admin/manage ";
    }
}