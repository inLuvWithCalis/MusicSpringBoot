package com.example.musicstore.Controllers.Admin;

import com.example.musicstore.domain.Song;
import com.example.musicstore.service.AlbumService;
import com.example.musicstore.service.ArtistService;
import com.example.musicstore.service.SongService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SongManageController {

    private final SongService songService;
    private final AlbumService albumService;
    private final ArtistService artistService;

    public SongManageController(SongService songService, AlbumService albumService, ArtistService artistService) {
        this.songService = songService;
        this.albumService = albumService;
        this.artistService = artistService;
    }

    @GetMapping("/admin/manage")
    public String getSongsTables(Model model) {
        List<Song> songs = songService.findAllSongs();
        model.addAttribute("songs", songs);
        return "admin/songManage";
    }

    @GetMapping("/admin/manage/delete")
    public String deleteSongs(Model model, @RequestParam long id) {
        this.songService.deleteSongByID(id);
        return "redirect:/admin/manage";
    }

    @GetMapping("/admin/manage/edit")
    public String editSong(Model model, @RequestParam long id) {
        Song editedSong = songService.findSongByID(id);
        model.addAttribute("song", editedSong);
        model.addAttribute("artists", artistService.findAllArtists());
        model.addAttribute("albums", albumService.findAllAlbums());
        return "admin/songEditing";
    }

    @PostMapping("/admin/manage/edited")
    public String editedSong(@ModelAttribute("song") Song song,
                             @RequestParam("songFile") MultipartFile file,
                             @RequestParam("artistId") Long artistId,
                             @RequestParam("albumId") Long albumId,
                             @RequestParam("existingFileUrl") String existingFileUrl,
                             @RequestParam("id") long id) {
        Song editedSong = songService.findSongByID(id);
        editedSong.setTitle(song.getTitle());
        editedSong.setArtist(artistService.findArtistByID(artistId));
        editedSong.setAlbum(albumService.findAlbumById(albumId));
        if (file != null && !file.isEmpty()) {
            editedSong.setFileUrl(file.getOriginalFilename());
        }else editedSong.setFileUrl(existingFileUrl);

        songService.Save(editedSong);
        return "redirect:/admin/manage";
    }

    @GetMapping("/admin/song/detail")
    public String getDetailSongs(Model model, @RequestParam long id) {
        Song song = songService.findSongByID(id);
        model.addAttribute("song", song);
        return "admin/songDetail";
    }
}
