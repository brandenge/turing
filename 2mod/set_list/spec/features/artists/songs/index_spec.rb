require 'rails_helper'

RSpec.describe "Artist's songs index page", type: :feature do
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

  it "shows all of the titles of the songs for the artist" do
    visit "/artists/#{artist.id}/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end

  it "links to each songs show page" do
    visit "/artists/#{artist.id}/songs"

    click_on song_1.title

    expect(current_path).to eq("/songs/#{song_1.id}")
  end

  it "shows the average song length for the artist" do
    visit "/artists/#{artist.id}/songs"

    expect(page).to have_content("Average Song Length for #{artist.name}: 203.5")
  end
end
