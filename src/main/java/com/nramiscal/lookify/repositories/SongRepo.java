package com.nramiscal.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nramiscal.lookify.models.Song;

@Repository
public interface SongRepo extends CrudRepository<Song, Long> {

	public List<Song> findByArtistContaining(String search);
	public List<Song> OrderByRatingDesc();
}
