require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe 'class methods' do
    describe '::alphabetical_names' do
      it 'orders names in ascending alphabetical order' do
        expect(Course.sort_by_name).to eq([@course_1, @course_2])
        expect(Resident.sort_by_name).to eq([@resident_7, @resident_3, @resident_6, @resident_5, @resident_2, @resident_1, @resident_4, @resident_8, @resident_10, @resident_9])
      end
    end
  end
end
