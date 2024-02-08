class Application < ApplicationRecord
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :status, presence: true

  has_many :pet_applications
  has_many :pets, through: :pet_applications
  has_many :shelters, through: :pets

  enum status: ["In Progress", "Pending", "Accepted", "Rejected"]

  def self.adopted_pet_count(shelters_id)
    Application.where(status: 2).joins(:pets).where(pets: { shelter_id: shelters_id }).count
  end

  def already_added?(adopted_pet_id)
    PetApplication.where(application_id: id).where(pet_id: adopted_pet_id).any?
  end

  def pet_application(pet_id)
    PetApplication.where(application_id: id).where(pet_id: pet_id).first
  end

  def accepted?
    pet_applications.pluck(:status).all?("Approved") && pets.any?
  end

  def rejected?
    pet_statuses = pet_applications.pluck(:status)
    pet_statuses.any?("Rejected") && !pet_statuses.any?("Pending")
  end

  def set_pets_adopted
    pets.each do |pet|
      pet.update(adoptable: false)
    end
  end
end
