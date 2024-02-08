class Department < ApplicationRecord
  has_many :employees
  has_many :employee_tickets, through: :employees
  has_many :tickets, through: :employee_tickets

  validates :name, presence: true
  validates :floor, presence: true
end
