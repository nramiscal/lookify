package com.nramiscal.lookify.controllers;

import java.util.List;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nramiscal.lookify.models.Song;
import com.nramiscal.lookify.services.SongService;

@Controller
public class SongController {
	
	private final SongService songService;
	
    public SongController(SongService songService){
        this.songService = songService;
    }
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
		
	@RequestMapping("/dashboard")
    public String dashboard(Model model) {
        List<Song> songs = songService.allSongs();
        model.addAttribute("songs", songs);
        return "dashboard";
    }
	
	@PostMapping("/search")
	public String searchPage(Model model, @ModelAttribute("artist") String artist) {
		List<Song> songs = songService.searchByString(artist);
		model.addAttribute("artist", artist);
		model.addAttribute("songs", songs);
		return "searchResult";
	}

	@RequestMapping("/new")
	public String add(@ModelAttribute("song") Song song) {
		return "new";
	}
	
	@PostMapping("/new")
	public String create(Model model, @Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
	        List<Song> songs = songService.allSongs();
	        model.addAttribute("songs", songs);
			return "new";
		}else {
			songService.addSong(song);
			return "redirect:/dashboard";
		}

	}
	
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
    		songService.deleteSong(id);
    		return "redirect:/dashboard";
    }
	
	@RequestMapping("/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Song song = songService.findSongById(id);
		model.addAttribute("song", song);
		return "showSong";
	}
	
	@RequestMapping("/topten")
	public String topten(Model model) {
		List<Song> songs = songService.topTen();
		model.addAttribute("songs", songs);
		return "topten";
	}

}
