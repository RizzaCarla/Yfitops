# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

User.destroy_all
Artist.destroy_all
Album.destroy_all
Song.destroy_all

# ------------------------------------------------------------------------------------

# Satisfy Users

demo = User.create!(
  username: 'LuckyDemoUser',
  email: 'LuckyDemoUser@gmail.com',
  password: '99999999'
)

rizza = User.create!(
  username: 'RizzaCarla12', 
  email: 'rizzacarla_12@satisfy.com', 
  password: 'satisfyowner'
)

dhiveshan = User.create!(
  username: 'Dave', 
  email: 'dc@gmail.com', 
  password: '1231234567812'
)
shane = User.create!(
  username: 'PunnyShane', 
  email: 'BestBoss@theoffice.com', 
  password: 'Sharrrrr'
)

izzi = User.create!(
  username: 'DizIzIzzie', 
  email: 'IzziIsTooCool@foryou.com', 
  password: 'Isabelle'
)

jae = User.create!(
  username: 'DaddyJae', 
  email: 'IamDaddy@tinder.com', 
  password: 'CallMeDaddy'
)

san = User.create!(
  username: 'SweetieSan', 
  email: 'SweetieSan@gmail.com', 
  password: 'ImAnAngelInDisguise'
)

# ------------------------------------------------------------------------------------

# Satisfy Artists

fkj = Artist.create!(
  artist_name: 'FKJ'
)

artistphotofile1 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/images/fkjartist.jpg')

fkj.artistPhotoUrl.attach(io: artistphotofile1, filename: 'fkjartist.jpg')

# ===

junemarieezy = Artist.create!(
  artist_name: '(((O)))'
)

artistphotofile2 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/images/junemarieezyartist.jpg')

junemarieezy.artistPhotoUrl.attach(io: artistphotofile2, filename: 'junemarieezyartist.jpg')

# ===
# ------------------------------------------------------------------------------------

# Satisfy Albums
ylangalbum = Album.create!(
  album_title: 'Ylang Ylang EP',
  artist_id: fkj.id
)

albumphotofile1 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/images/ylang_photo.JPG')

ylangalbum.albumPhotoUrl.attach(io: albumphotofile1, filename: 'ylang_photo.JPG')

# ===

junemarieezyalbum2 = Album.create!(
  album_title: '(((2)))',
  artist_id: junemarieezy.id
)

albumphotofile2 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/images/junemarieezy2_photo.JPG')

junemarieezyalbum2.albumPhotoUrl.attach(io: albumphotofile2, filename: 'junemarieezy2_photo.JPG')

# ------------------------------------------------------------------------------------

# Satisfy Songs

iFeel = Song.create!(
  album_id: junemarieezyalbum2.id,
  song_title: 'iFeel',
  total_song_time: '4:29'
)

songfile1 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/songs/iFeel.mp3')

iFeel.songUrl.attach(io: songfile1, filename: 'iFeel.mp3')

# ===

ylang = Song.create!(
  album_id: ylangalbum.id,
  song_title: 'Ylang Ylang',
  total_song_time: '3:33'
)

songfile2 = open('https://satisfy-seed.s3-us-west-1.amazonaws.com/songs/Ylang_Ylang.mp3')

ylang.songUrl.attach(io: songfile2, filename: 'Ylang_Ylang.mp3')
