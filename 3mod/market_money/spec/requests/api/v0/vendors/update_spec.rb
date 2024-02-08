require 'rails_helper'

RSpec.describe 'Update Vendor API', type: :request do
  before(:each) do
    @vendor_attributes = {
      name: 'Buzzy Bees',
      description: 'local honey and wax products',
      contact_name: 'Berly Couwer',
      contact_phone: '8389928383',
      credit_accepted: false
    }

    @vendor = create(:vendor, @vendor_attributes)
  end

  context 'successfully updates' do
    it 'can update a vendor' do
      vendor_params = {
        contact_name: 'Kimberly Couwer',
        credit_accepted: false
      }

      patch api_v0_vendor_path(@vendor),
        headers: JSON_HEADER,
        params: JSON.generate(vendor: vendor_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      @vendor.reload

      expect(@vendor.contact_name).to eq(vendor_params[:contact_name])
      expect(@vendor.credit_accepted).to eq(vendor_params[:credit_accepted])
    end
  end

  context 'fails to update' do
    it 'sends error details for invalid id' do
      invalid_id = 123123123123

      vendor_params = {
        contact_name: 'Kimberly Couwer',
        credit_accepted: false
      }

      patch api_v0_vendor_path(invalid_id),
        headers: JSON_HEADER,
        params: JSON.generate(vendor: vendor_params)

      @vendor.reload

      expect(@vendor.contact_name).to_not eq(vendor_params[:contact_name])

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

    it 'sends error details for trying to update an attribute to an empty string' do
      vendor_params = {
        contact_name: '',
        credit_accepted: false
      }

      patch api_v0_vendor_path(@vendor),
        headers: JSON_HEADER,
        params: JSON.generate(vendor: vendor_params)

      @vendor.reload

      expect(@vendor.contact_name).to_not eq(vendor_params[:contact_name])

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Validation failed: Contact name can't be blank")
    end
  end
end
