class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  enum user_type: { 'Invited' => 0, 'Hosting' => 1 }
  validates :user_id, presence: true, numericality: true
  validates :viewing_party_id, presence: true, numericality: true
end
