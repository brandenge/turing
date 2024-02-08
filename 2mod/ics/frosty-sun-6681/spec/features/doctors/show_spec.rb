require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  before(:each) do
    visit doctor_path(@doctor1)
  end

  it 'has headers' do
    expect(page).to have_content('Doctor Profile')
    expect(page).to have_content('Patients')
  end

  it 'has the name of the doctor' do
    expect(page).to have_content("Doctor: #{@doctor1.name}")
  end

  it 'has the specialty of the doctor' do
    expect(page).to have_content("Specialty: #{@doctor1.specialty}")
  end

  it 'has the university of the doctor' do
    expect(page).to have_content("University: #{@doctor1.university}")
  end

  it 'has the hospital of the doctor' do
    expect(page).to have_content("Hospital: #{@doctor1.hospital_name}")
  end

  it 'has all the patients of the doctor' do
    @doctor1.patients.each do |patient|
      within("#patient-#{patient.id}") do
        expect(page).to have_content(patient.name)
      end
    end
  end

  it 'can delete a patient from the doctor' do
    patient = @doctor1.patients.first

    within("#patient-#{patient.id}") do
      expect(page).to have_button('Delete Patient')
      click_button('Delete Patient')
    end

    expect(current_path).to eq(doctor_path(@doctor1))
    expect(page).to_not have_content(patient.name)
  end

  it 'only deletes the patient from the current doctor and not any other doctors' do
    patient = @doctor1.patients.second

    within("#patient-#{patient.id}") do
      expect(page).to have_button('Delete Patient')
      click_button('Delete Patient')
    end

    expect(current_path).to eq(doctor_path(@doctor1))
    expect(page).to_not have_content(patient.name)
    visit doctor_path(@doctor2)

    within("#patient-#{patient.id}") do
      expect(page).to have_content(patient.name)
    end
  end
end
