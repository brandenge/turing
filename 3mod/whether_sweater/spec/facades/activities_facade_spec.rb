require 'rails_helper'

RSpec.describe ActivitiesFacade, vcr: { record: :new_episodes } do
  subject(:activities_facade) { ActivitiesFacade.new }

  describe 'instance methods' do
    describe '#get_activities_for_weather' do
      it 'returns two activities appropriate for the weather' do
        actual = activities_facade.get_activities_for_weather(65)

        expect(actual).to be_an(Array)
        expect(actual.count).to eq(2)
      end
    end
  end
end
