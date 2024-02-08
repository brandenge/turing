class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :teas, -> { distinct }, through: :subscriptions

  validates_presence_of :first_name, :last_name, :email, :address
end
