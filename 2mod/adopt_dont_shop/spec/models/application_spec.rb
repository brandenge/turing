require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :street_address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :status}
    it { should define_enum_for(:status) }
  end

  describe 'relationships' do
    it {should have_many :pet_applications}
    it {should have_many(:pets).through(:pet_applications)}
  end

  describe 'class methods' do
    describe '::adopted_pet_count' do
      it 'returns the number of the shelters adopted pets' do
        expect(Application.adopted_pet_count(@shelter_1.id)).to eq(0)
      end
    end
  end

  describe 'instance methods' do
    describe '#already_added?' do
      it 'returns true if the pet is already added to the application' do
        expect(@app_2.already_added?(@pet_1.id)).to eq(true)
      end

      it 'returns false if the pet is not already added to the application' do
        expect(@app_2.already_added?(@pet_7.id)).to eq(false)
      end
    end

    describe '#pet_application' do
      it 'returns the pet application for the given pet id' do
        expect(@app_2.pet_application(@pet_1.id)).to eq(@pet_app_1)
      end
    end

    describe '#accepted?' do
      it 'returns true if all of the pets are approved' do
        @pet_app_1.update(status: "Approved")
        @pet_app_2.update(status: "Approved")
        @pet_app_3.update(status: "Approved")
        @pet_app_4.update(status: "Approved")
        expect(@app_2.accepted?).to eq(true)
      end

      it 'returns false if not all of the pets are approved' do
        @pet_app_1.update(status: "Approved")
        @pet_app_2.update(status: "Approved")
        @pet_app_3.update(status: "Pending")
        @pet_app_4.update(status: "Approved")
        expect(@app_2.accepted?).to eq(false)

        @pet_app_3.update(status: "Rejected")
        expect(@app_2.accepted?).to eq(false)
      end

      it 'returns false if there are no pets on the application' do
        expect(@app_1.accepted?).to eq(false)
      end
    end

    describe '#rejected?' do
      it 'returns true if all of the pets are either approved or rejected, and at least 1 pet is rejected' do
        expect(@app_2.rejected?).to eq(false)
        @pet_app_1.update(status: "Approved")
        @pet_app_2.update(status: "Approved")
        @pet_app_3.update(status: "Rejected")
        @pet_app_4.update(status: "Approved")
        expect(@app_2.rejected?).to eq(true)
      end

      it 'returns false if all of the pets are approved' do
        @pet_app_1.update(status: "Approved")
        @pet_app_2.update(status: "Approved")
        @pet_app_3.update(status: "Approved")
        @pet_app_4.update(status: "Approved")
        expect(@app_2.rejected?).to eq(false)
      end

      it 'returns false if any of the pets are still pending approval' do
        @pet_app_1.update(status: "Approved")
        @pet_app_2.update(status: "Approved")
        @pet_app_3.update(status: "Pending")
        @pet_app_4.update(status: "Approved")
        expect(@app_2.rejected?).to eq(false)
      end
    end

    describe '#set_pets_adopted' do
      it 'updates all of the pets of the application to no longer be adoptable' do
        expect(@app_2.pets.pluck(:adoptable).all?(true))
        @app_2.set_pets_adopted
        expect(@app_2.pets.pluck(:adoptable).all?(false))
      end
    end
  end
end
