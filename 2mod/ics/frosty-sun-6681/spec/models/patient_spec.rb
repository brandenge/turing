require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do
    describe '.adults' do
      it 'returns all patients who are 18 or older' do
        expect(Patient.adults).to eq([
          @patient1, @patient2, @patient3,
          @patient4, @patient5, @patient6,
          @patient7, @patient8, @patient9,
          @patient10, @patient11, @patient12,
          @patient13, @patient14
        ])
        expect(Patient.adults).to_not include(@child_patient)
      end
    end

    describe '.sort_alphabetically_by_name' do
      it 'returns patients in alphabetical order by name' do
        expect(Patient.sort_alphabetically_by_name).to eq([
          @patient12, @child_patient, @patient6,
          @patient1, @patient4, @patient7,
          @patient8, @patient3, @patient14,
          @patient13, @patient9, @patient2,
          @patient5, @patient11, @patient10
        ])
      end
    end
  end
end
