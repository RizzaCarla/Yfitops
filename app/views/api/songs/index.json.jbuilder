@songs.each do |song|
  if song.songUrl.attached?
    json.set! song.id do
      json.extract! song, :id, :song_title, :total_song_time, :album_id, :artist
      json.albumPhotoUrl url_for(song.albumPhotoUrl)
      json.artistPhotoUrl url_for(song.artistPhotoUrl)
      json.songUrl url_for(song.songUrl)
    end
  end
end