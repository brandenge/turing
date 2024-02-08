class Patient < ApplicationRecord
  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients

  def self.adults
    where('age >= 18')
  end

  def self.sort_alphabetically_by_name
    order(:name)
  end
end
