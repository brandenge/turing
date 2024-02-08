class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  def viewing_party_movie_ids
    viewing_parties.pluck(:movie_id)
  end

  def user_type(party_id)
    user_viewing_parties.where(user_id: id).where(viewing_party_id: party_id).first.user_type
  end
end
