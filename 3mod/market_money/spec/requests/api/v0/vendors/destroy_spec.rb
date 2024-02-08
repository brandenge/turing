require 'rails_helper'

RSpec.describe 'Destroy Vendor API', type: :request do
  before(:each) do
    @vendor = create(:vendor)
  end

  context 'using a valid vendor id' do
    it 'can destroy a vendor' do
      expect(Vendor.count).to eq(1)
      expect{ delete api_v0_vendor_path(@vendor), headers: JSON_HEADER }
        .to change(Vendor, :count).by(-1)
      expect(Vendor.count).to eq(0)

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect{ Vendor.find(@vendor.id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'using an invalid vendor id' do
    it 'sends error details for invalid id' do
      invalid_id = 123123123123

      expect(Vendor.count).to eq(1)
      expect{ delete api_v0_vendor_path(invalid_id), headers: JSON_HEADER }
        .to change(Vendor, :count).by(0)
      expect(Vendor.count).to eq(1)

      expect{ Vendor.find(@vendor.id) }.to_not raise_error

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
