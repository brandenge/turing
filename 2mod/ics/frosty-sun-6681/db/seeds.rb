# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

Hospital.destroy_all
DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all

@hospital1 = create(:hospital)
@hospital2 = create(:hospital)
@hospital3 = create(:hospital)

@doctor1 = create(:doctor, hospital: @hospital1)
@doctor2 = create(:doctor, hospital: @hospital1)
@doctor3 = create(:doctor, hospital: @hospital1)
@doctor4 = create(:doctor, hospital: @hospital1)
@doctor5 = create(:doctor, hospital: @hospital2)
@doctor6 = create(:doctor, hospital: @hospital2)
@doctor7 = create(:doctor, hospital: @hospital2)
@doctor8 = create(:doctor, hospital: @hospital3)
@doctor9 = create(:doctor, hospital: @hospital3)

@patient1 = create(:patient, :adult, name: 'Bob')
@patient2 = create(:patient, :adult, name: 'Sally')
@patient3 = create(:patient, :adult, name: 'John')
@patient4 = create(:patient, :adult, name: 'Jane')
@patient5 = create(:patient, :adult, name: 'Sue')
@patient6 = create(:patient, :adult, name: 'Bill')
@patient7 = create(:patient, :adult, name: 'Jill')
@patient8 = create(:patient, :adult, name: 'Joe')
@patient9 = create(:patient, :adult, name: 'Mike')
@patient10 = create(:patient, :adult, name: 'Tom')
@patient11 = create(:patient, :adult, name: 'Tim')
@patient12 = create(:patient, :adult, name: 'Allie')
@patient13 = create(:patient, :adult, name: 'Livia')
@patient14 = create(:patient, :adult, name: 'Lily')
@child_patient = create(:patient, :child, name: 'Ari')

@doctor_patient1 = create(:doctor_patient, doctor: @doctor1, patient: @patient1)
@doctor_patient2 = create(:doctor_patient, doctor: @doctor1, patient: @patient2)
@doctor_patient3 = create(:doctor_patient, doctor: @doctor1, patient: @patient3)
@doctor_patient4 = create(:doctor_patient, doctor: @doctor1, patient: @patient4)
@doctor_patient5 = create(:doctor_patient, doctor: @doctor1, patient: @patient5)
@doctor_patient6 = create(:doctor_patient, doctor: @doctor2, patient: @patient2)
@doctor_patient7 = create(:doctor_patient, doctor: @doctor2, patient: @patient3)
@doctor_patient8 = create(:doctor_patient, doctor: @doctor2, patient: @patient4)
@doctor_patient9 = create(:doctor_patient, doctor: @doctor2, patient: @patient5)
@doctor_patient10 = create(:doctor_patient, doctor: @doctor3, patient: @patient3)
@doctor_patient11 = create(:doctor_patient, doctor: @doctor3, patient: @patient4)
@doctor_patient12 = create(:doctor_patient, doctor: @doctor3, patient: @patient5)
@doctor_patient13 = create(:doctor_patient, doctor: @doctor4, patient: @patient4)
@doctor_patient14 = create(:doctor_patient, doctor: @doctor4, patient: @patient5)
@doctor_patient15 = create(:doctor_patient, doctor: @doctor5, patient: @patient5)
@doctor_patient16 = create(:doctor_patient, doctor: @doctor5, patient: @patient6)
@doctor_patient17 = create(:doctor_patient, doctor: @doctor5, patient: @patient7)
@doctor_patient18 = create(:doctor_patient, doctor: @doctor6, patient: @patient6)
@doctor_patient19 = create(:doctor_patient, doctor: @doctor6, patient: @patient7)
@doctor_patient20 = create(:doctor_patient, doctor: @doctor6, patient: @patient8)
@doctor_patient21 = create(:doctor_patient, doctor: @doctor7, patient: @patient7)
@doctor_patient22 = create(:doctor_patient, doctor: @doctor7, patient: @patient8)
@doctor_patient23 = create(:doctor_patient, doctor: @doctor7, patient: @patient9)
@doctor_patient24 = create(:doctor_patient, doctor: @doctor8, patient: @patient10)
@doctor_patient25 = create(:doctor_patient, doctor: @doctor8, patient: @patient11)
@doctor_patient26 = create(:doctor_patient, doctor: @doctor8, patient: @patient12)
@doctor_patient27 = create(:doctor_patient, doctor: @doctor9, patient: @patient13)
@doctor_patient28 = create(:doctor_patient, doctor: @doctor9, patient: @patient14)
@doctor_patient29 = create(:doctor_patient, doctor: @doctor9, patient: @child_patient)
