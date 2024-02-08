require 'rails_helper'

RSpec.describe Song, type: :model do
  let!(:artist) { Artist.create!(name: 'Carly Rae Jepsen') }
  let!(:song_1) do
    artist.songs.create!(title:       "I Really Like You",
                         length:      208,
                         play_count:  243810867)
  end
  let!(:song_2) do
    artist.songs.create!(title:       "Call Me Maybe",
                         length:      199,
                         play_count:  1214722172)
  end
  let!(:song_3) do
    artist.songs.create!(title:       "Another Carly Rae Jepsen Song",
                         length:      582,
                         play_count:  23092349)
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :length }
    it { should validate_presence_of :play_count }
    it { should validate_presence_of :artist_id }
  end

  describe "relationships" do
     it { should belong_to :artist }
  end

  describe 'class methods' do
    it '::song_count' do
      expect(Song.song_count).to eq(3)
    end
  end
end
