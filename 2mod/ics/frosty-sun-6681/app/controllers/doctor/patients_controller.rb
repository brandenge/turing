class Doctor::PatientsController < ApplicationController
  before_action :find_doctor_patient, only: [:destroy]

  def destroy
    @doctor_patient.destroy
    redirect_to doctor_path(params[:doctor_id])
  end

  private

  def find_doctor_patient
    @doctor_patient = DoctorPatient.find_by_doctor_and_patient(params[:doctor_id], params[:id])
  end
end
