require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe 'class methods' do
    describe '::average_age' do
      it 'returns the average age of all residents' do
        expect(Resident.average_age).to eq(44.3)
      end
    end
  end
end
