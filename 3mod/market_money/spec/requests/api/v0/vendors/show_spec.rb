require 'rails_helper'

RSpec.describe 'Show Vendor API', type: :request do
  context 'using a valid vendor id' do
    it 'sends the requested vendor' do
      vendor_object = create(:vendor)

      get api_v0_vendor_path(vendor_object), headers: JSON_HEADER

      expect(response).to be_successful
      expect(response.status).to eq(200)

      vendor = JSON.parse(response.body, symbolize_names: true)

      expect(vendor).to have_key(:data)
      expect(vendor[:data]).to be_a(Hash)

      expect(vendor[:data]).to have_key(:id)
      expect(vendor[:data][:id]).to be_a(String)

      expect(vendor[:data]).to have_key(:type)
      expect(vendor[:data][:type]).to eq('vendor')

      expect(vendor[:data]).to have_key(:attributes)
      expect(vendor[:data][:attributes]).to be_a(Hash)

      expect(vendor[:data][:attributes]).to have_key(:name)
      expect(vendor[:data][:attributes][:name]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:description)
      expect(vendor[:data][:attributes][:description]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:contact_name)
      expect(vendor[:data][:attributes][:contact_name]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:contact_phone)
      expect(vendor[:data][:attributes][:contact_phone]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:credit_accepted)
      expect(vendor[:data][:attributes][:credit_accepted]).to be_in([true, false])
    end
  end

  context 'using an invalid market id' do
    it 'sends error details' do
      invalid_id = 123123123123
      get api_v0_vendor_path(invalid_id), headers: JSON_HEADER

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Couldn't find Vendor with 'id'=#{invalid_id}")
    end
  end
end
