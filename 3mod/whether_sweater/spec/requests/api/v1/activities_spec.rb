require 'rails_helper'

RSpec.describe 'Activites', type: :request, vcr: { record: :new_episodes } do
  xit 'returns a collection of activities appropriate for the weather' do
    get api_v1_activities_path({ destination: 'chicago,il' })
    expect(response).to be_successful
    expect(response.status).to eq(200)

    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to be_a(Hash)
    expect(activities).to have_key(:data)

    expect(activities[:data]).to be_a(Hash)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data]).to have_key(:attributes)

    attributes = activities[:data][:attributes]
    expect(attributes).to be_a(Hash)
    expect(attributes).to have_key(:destination)
    expect(attributes).to have_key(:forecast)
    expect(attributes).to have_key(:activities)

    expect(attributes[:destination]).to be_a(String)
    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes[:activities]).to be_a(Hash)

    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast]).to have_key(:temperature)
    expect(attributes[:forecast][:summary]).to be_a(String)
    expect(attributes[:forecast][:temperature]).to be_a(String)

    attributes[:activities].keys.map do |activity|
      activity = attributes[:activities][activity]
      expect(activity).to have_key(:type)
      expect(activity).to have_key(:participants)
      expect(activity).to have_key(:price)
      expect(activity[:type]).to be_a(String)
      expect(activity[:participants]).to be_a(Integer)
      expect(activity[:price]).to be_a(Numeric)
    end
  end
end
