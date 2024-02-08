require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe 'instance methods' do
    describe '#residents_sorted_by_name' do
      it 'sorts the course\'s residents by name' do
        expect(@course_1.residents_sorted_by_name).to eq([@resident_3, @resident_5, @resident_2, @resident_1, @resident_4])
        expect(@course_2.residents_sorted_by_name).to eq([@resident_7, @resident_3, @resident_6, @resident_5, @resident_2, @resident_1, @resident_4, @resident_8, @resident_10, @resident_9])
      end
    end
  end
end
