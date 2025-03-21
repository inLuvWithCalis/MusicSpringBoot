package com.example.musicstore.Controllers;

import com.example.musicstore.domain.Artist;
import com.example.musicstore.domain.Song;
import com.example.musicstore.service.ArtistService;
import com.example.musicstore.service.SongService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
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

    @RequestMapping({"/home", "", "/"})
    public String getHomePage(Model model, @AuthenticationPrincipal OAuth2User oauth2User) {
        List<Artist> artists = artistService.findAllArtists();
        List<Song> songs = songService.findAllSongs();
        model.addAttribute("artists", artists);
        model.addAttribute("songs", songs);

        if (oauth2User != null) {
            String name = oauth2User.getAttribute("name");
            String email = oauth2User.getAttribute("email");
            model.addAttribute("googleName", name);
            model.addAttribute("googleEmail", email);
        }

        return "homepage/index";
    }

}
