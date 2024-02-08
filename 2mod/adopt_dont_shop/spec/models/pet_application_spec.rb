require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'validations' do
    it { should define_enum_for(:status) }
  end

  describe 'relationships' do
    it {should belong_to :application}
    it {should belong_to :pet}
  end

  describe "class methods" do
    it "::pets_with_open_apps(shelter_id)" do
      actual = PetApplication.pets_with_open_apps(@shelter_1.id)
      actual.sort_by! do |(pet_name, pet_id, app_id)|
        "#{pet_id} - #{app_id}"
      end
      expect(actual).to eq([
        [@pet_1.name, @pet_1.id, @app_2.id],
        [@pet_1.name, @pet_1.id, @app_3.id],
        [@pet_2.name, @pet_2.id, @app_2.id],
        [@pet_2.name, @pet_2.id, @app_3.id],
        [@pet_3.name, @pet_3.id, @app_2.id],
        [@pet_3.name, @pet_3.id, @app_3.id],
        [@pet_4.name, @pet_4.id, @app_2.id],
        [@pet_5.name, @pet_5.id, @app_3.id]
      ])
    end
  end
end
