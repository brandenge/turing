require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'instance methods' do
    describe '#hospital_name' do
      it 'returns the name of the hospital the doctor works at' do
        expect(@doctor1.hospital_name).to eq(@doctor1.hospital.name)
      end
    end
  end
end
