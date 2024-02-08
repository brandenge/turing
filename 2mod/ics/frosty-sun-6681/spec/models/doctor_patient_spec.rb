require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it {should belong_to :doctor}
  it {should belong_to :patient}

  describe 'class methods' do
    describe '.find_by_doctor_and_patient' do
      it 'returns the doctor_patient record with the given doctor and patient ids' do
        expect(DoctorPatient.find_by_doctor_and_patient(@doctor1.id, @patient1.id)).to eq(@doctor_patient1)
      end
    end
  end
end
