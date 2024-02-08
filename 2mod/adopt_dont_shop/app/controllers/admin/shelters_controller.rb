 class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetial_order
    @shelters_with_pending_applications = Shelter.with_pending_applications
  end

  def show
    @shelters = Shelter.find(params[:id])
    @shelter_name = Shelter.find_shelter_name(params[:id])
    @shelter_city = Shelter.find_shelter_city(params[:id])
    @avg_pet_age = @shelters.average_age_of_adoptable_pets
    @adoptable_pets_count = @shelters.count_of_adoptable_pets
    @adopted_pets_count = Application.adopted_pet_count(@shelters.id)
    @pending_pets = PetApplication.pets_with_open_apps(@shelters.id)
  end
end