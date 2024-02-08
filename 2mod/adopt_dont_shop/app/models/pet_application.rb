class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  
  validates :status, presence: true


  enum status: ["Pending", "Approved", "Rejected"]

  def self.pets_with_open_apps(shelter_id)
    pending_pets = PetApplication.joins(:pet).where( pets: { shelter_id: shelter_id } ).where(status: "Pending").pluck(:pet_id, :application_id)
    pending_pets.map! do |(pet_id, app_id)|
      [Pet.find(pet_id).name, pet_id, app_id]
    end
  end
end
