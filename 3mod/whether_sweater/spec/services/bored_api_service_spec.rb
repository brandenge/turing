require 'rails_helper'

RSpec.describe BoredApiService, vcr: { record: :new_episodes } do
  subject(:bored_api_service) { BoredApiService.new }

  describe 'instance methods' do
    describe '#bored_api' do
      it 'returns the latitude and longitude coordinates of a city' do
        actual = bored_api_service.get_activities_for_weather(65)

        expect(actual).to be_a(Array)
        expect(actual.count).to eq(2)

        actual.map do |activity|
          expect(activity).to be_a(Hash)
          expect(activity.keys.count).to eq(7)
          expect(activity).to have_key(:activity)
          expect(activity).to have_key(:type)
          expect(activity).to have_key(:participants)
          expect(activity).to have_key(:price)
          expect(activity).to have_key(:link)
          expect(activity).to have_key(:key)
          expect(activity).to have_key(:accessibility)

          expect(activity[:activity]).to be_a(String)
          expect(activity[:type]).to be_a(String)
          expect(activity[:participants]).to be_an(Integer)
          expect(activity[:price]).to be_a(Numeric)
          expect(activity[:link]).to be_a(String)
          expect(activity[:key]).to be_a(String)
          expect(activity[:accessibility]).to be_a(Numeric)
        end
      end
    end
  end
end
