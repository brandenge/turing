class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :movie_id, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :start_time, presence: true
end
