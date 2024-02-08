class PatientsController < ApplicationController
  before_action :find_adult_patients, only: [:index]

  def index

  end

  private

  def find_adult_patients
    @patients = Patient.adults
  end
end
