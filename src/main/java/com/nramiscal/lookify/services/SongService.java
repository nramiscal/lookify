package com.nramiscal.lookify.services;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nramiscal.lookify.models.Song;
import com.nramiscal.lookify.repositories.SongRepo;



@Service
public class SongService {
	
	private SongRepo songRepo;
	
	public SongService(SongRepo songRepo) {
		this.songRepo = songRepo;
	}
	
	public List<Song> allSongs() {
		return (List<Song>) songRepo.findAll();

	}

	public Song findSongById(Long id) {
			return songRepo.findOne(id);
	}
	
	public void addSong(Song song) {
			songRepo.save(song);
	}
	
	public void updateSong(Long id, Song song) {
			songRepo.save(song);
			
	}
	
	public void deleteSong(Long id) {
			songRepo.delete(id);
	}
	
	public List<Song> topTen(){
		List<Song> songs = (List<Song>) songRepo.OrderByRatingDesc();
		for(int i = 0; i < songs.size(); i++){
			if(i > 10){
				songs.remove(i);
			}
		}	
		return songs;
	} 
	
	public List<Song> searchByString(String search){
		 List<Song> songs = songRepo.findByArtistContaining(search);
		 return songs;
	}
}

