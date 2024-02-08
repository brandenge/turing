class Artist < ApplicationRecord
  has_many :songs

  validates_presence_of :name

  def self.with_a_million_play_count_song
    joins(:songs).where('songs.play_count >= ?', 1_000_000).distinct
  end

  def self.on_three_playlists
    joins(songs: :playlists).group(:id).having('COUNT(playlists.id) >= ?', 3)
  end

  def self.top_by_total_plays(limit)
    joins(:songs).group(:id).order('sum(songs.play_count) desc').limit(limit)
  end

  def average_song_length
    self.songs.average(:length)
  end

  def self.on_playlist_created_after(date)
    joins(songs: :playlists).where('playlists.created_at > ?', date).distinct
  end

  def playlists_featured_on
    Playlist.joins(:songs).where('songs.artist_id': id).distinct.order('playlists.created_at')
  end
end
