require 'rails_helper'

RSpec.describe Artist, type: :model do
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
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :songs }
  end

  describe "instance methods" do
    describe "#average_song_length" do
      it "returns the average song length" do
        expect(artist.average_song_length.round(2)).to eq(329.67)
      end
    end
  end
end
