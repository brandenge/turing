require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
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

  it "can see all songs titles and play count" do
    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it "can see a header with text - All Songs" do
    visit "/songs"

    expect(page).to have_content("All Songs")
  end
end
