json.extract! @album, :id, :album_title, :artist_id, :songs, :artist
json.albumPhotoUrl url_for(@album.albumPhotoUrl)
json.artistPhotoUrl url_for(@album.artistPhotoUrl)
