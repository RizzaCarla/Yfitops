# == Schema Information
#
# Table name: songs
#
#  id              :bigint           not null, primary key
#  album_id        :integer          not null
#  song_title      :string           not null
#  total_song_time :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
