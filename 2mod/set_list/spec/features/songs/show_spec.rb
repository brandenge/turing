require 'rails_helper'

RSpec.describe "song show page", type: :feature do
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

  it 'can see the song\'s title, length, and play count' do
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(song_1.title)
    expect(page).to_not have_content(song_2.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
  end

  it 'displays the name of the artist for the song' do
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(artist.name)
  end

  it 'can see another song\'s title, length, and play count' do
    visit "/songs/#{song_2.id}"

    expect(page).to have_content("Title: #{song_2.title}")
    expect(page).to have_content("Length: #{song_2.length}")
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it 'can see a link back to the song index page' do
    visit "/songs/#{song_1.id}"

    expect(page).to have_link("Songs Index Page")
  end

  it 'can click a link back to the song index page' do
    visit "/songs/#{song_1.id}"

    click_link "Songs Index Page"

    expect(current_path).to eq("/songs")
  end
end
