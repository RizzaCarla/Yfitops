import { connect } from 'react-redux';
import SearchSongIndex from './search_song_index';
import { fetchSongs, fetchSong, searchSongs } from '../../../actions/song_actions';
import { fetchArtists, fetchArtist, searchArtists } from '../../../actions/artist_actions';
import { fetchAlbums, fetchAlbum, searchAlbums } from '../../../actions/album_actions';

const msp = (state, ownProps) => ({
  songs: Object.values(state.entities.songs),
  artists: Object.values(state.entities.artists),
  albums: Object.values(state.entities.albums),
  searchQuery: state.searchReducer.searchQuery,
  filteredSong: ownProps.filteredSong,
  filteredSongPhotoUrl: ownProps.filteredSong.photoUrl,
  filteredSongArtistName: ownProps.filteredSong.artistName
})

const mdp = dispatch => ({
  fetchSongs: () => dispatch(fetchSongs()),
  fetchArtists: () => dispatch(fetchArtists()),
  fetchAlbums: () => dispatch(fetchAlbums()),
  fetchSong: (song) => dispatch(fetchSong(song)),
  fetchArtist: (artist) => dispatch(fetchArtist(artist)),
  fetchAlbum: (album) => dispatch(fetchAlbum(album)),
  searchSongs: (searchQuery) => dispatch(searchSongs(searchQuery)),
  searchArtists: (searchQuery) => dispatch(searchArtists(searchQuery)),
  searchAlbums: (searchQuery) => dispatch(searchAlbums(searchQuery))
})

export default connect(msp, mdp)(SearchSongIndex)