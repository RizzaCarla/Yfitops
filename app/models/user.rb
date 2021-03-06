# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :username, :email, :session_token, :password_digest, presence: true
  validates :username, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    (user && user.is_password?(password)) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  has_one :main_playlist,
    foreign_key: :author_id,
    class_name: :MainPlaylistLike
  
  has_many :other_playlists,
    foreign_key: :author_id,
    class_name: :OtherPlaylist

  has_many :likes,
    foreign_key: :liker_id,
    class_name: :Like

  has_many :liked_songs,
    through: :likes,
    source: :likeable,
    source_type: 'Song'

  has_many :liked_albums,
    through: :likes,
    source: :likeable,
    source_type: 'Album'

  has_many :liked_artists,
    through: :likes,
    source: :likeable,
    source_type: 'Artist'

  has_one_attached :userPhotoUrl
end
