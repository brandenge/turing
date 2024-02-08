class PetApplicationsController < ApplicationController
  def create
    PetApplication.create(pet_app_params)
    redirect_to "/applications/#{params[:application_id]}"
  end

  def update
    pet_app = PetApplication.find(params[:id])
    pet_app.update(pet_app_params)
    redirect_to "/admin/applications/#{pet_app.application_id}"
  end

  private

  def pet_app_params
    params.permit(:status, :application_id, :pet_id)
  end
end
