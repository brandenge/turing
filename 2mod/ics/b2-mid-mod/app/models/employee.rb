class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  validates :name, presence: true
  validates :level, presence: true, numericality: true
end
