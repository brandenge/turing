class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def self.find_by_doctor_and_patient(doctor_id, patient_id)
    where(doctor_id: doctor_id, patient_id: patient_id).first
  end
end
