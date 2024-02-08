class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, numericality: true
  validates :city, presence: true

  has_many :pets, dependent: :destroy
  has_many :pet_applications, through: :pets

  def self.with_pending_applications
    joins(pets: :applications).where(applications: { status: '1' }).distinct.order(:name)
  end

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def self.order_by_number_of_pets
    select("shelters.*, count(pets.id) AS pets_count")
      .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
      .group("shelters.id")
      .order("pets_count DESC")
  end

  def self.reverse_alphabetial_order
    find_by_sql("SELECT * FROM shelters ORDER BY name DESC")
  end

  def self.find_shelter_name(data)
    find_by_sql("SELECT name FROM shelters WHERE id = #{data}").first.name
  end
  
  def self.find_shelter_city(data)
    find_by_sql("SELECT city FROM shelters WHERE id = #{data}").first.city
  end

  
  def pet_count
    pets.count
  end
  
  def adoptable_pets
    pets.where(adoptable: true)
  end
  
  def alphabetical_pets
    adoptable_pets.order(name: :asc)
  end
  
  def shelter_pets_filtered_by_age(age_filter)
    adoptable_pets.where('age >= ?', age_filter)
  end
  
  def average_age_of_adoptable_pets
    adoptable_pets.average(:age).to_f
  end
  
  def count_of_adoptable_pets
    adoptable_pets.count
  end
end
