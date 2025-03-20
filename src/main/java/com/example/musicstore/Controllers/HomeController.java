package com.example.musicstore.Controllers;

import com.example.musicstore.domain.Artist;
import com.example.musicstore.domain.Song;
import com.example.musicstore.service.ArtistService;
import com.example.musicstore.service.SongService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    private final SongService songService;
    private final ArtistService artistService;

    public HomeController(SongService songService, ArtistService artistService) {
        this.songService = songService;
        this.artistService = artistService;
    }

    @RequestMapping("/home")
    public String getHomePage(Model model) {
        List<Artist> artists = artistService.findAllArtists();
        List<Song> songs = songService.findAllSongs();
        model.addAttribute("artists", artists);
        model.addAttribute("songs", songs);
        return "homepage/index";
    }
}
