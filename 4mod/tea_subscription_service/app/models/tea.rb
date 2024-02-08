class Tea < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :customers, -> { distinct }, through: :subscriptions

  validates_presence_of :title, :description, :temperature, :brew_time

  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true, numericality: true
  validates :brew_time, presence: true, numericality: true
end
