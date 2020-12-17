import * as songAPIUtil from '../util/api_song_util';

export const RECEIVE_SONGS = 'RECEIVE_SONGS';
export const RECEIVE_SONG = 'RECEIVE_SONG';
export const CHANGE_CURRENT_SONG = 'CHANGE_CURRENT_SONG';
export const CHECK_PLAY = 'CHECK_PLAY';
export const CHECK_PAUSE = 'CHECK_PAUSE';

export const changeCurrentSong = (songId) => ({
  type: CHANGE_CURRENT_SONG,
  songId
})

export const checkPlay = (time) => ({
  type: CHECK_PLAY,
  time
})

export const checkPause = (time) => ({
  type: CHECK_PAUSE,
  time
})

export const receiveSongs = songs => ({
  type: RECEIVE_SONGS,
  songs
})

export const receiveSong = song => ({
  type: RECEIVE_SONG,
  song
})

export const fetchSongs = () => dispatch => (
  songAPIUtil.fetchSongs()
    .then((songs) => dispatch(receiveSongs(songs)))
)

export const fetchSong = id => dispatch => (
  songAPIUtil.fetchSong(id)
    .then((song) => dispatch(receiveSong(song)))
)