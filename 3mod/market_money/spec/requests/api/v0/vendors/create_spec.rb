require 'rails_helper'

RSpec.describe 'Create Vendor API', type: :request do
  context 'has all required attributes' do
    it 'can create a new vendor' do
      vendor_params = {
        name: 'Buzzy Bees',
        description: 'local honey and wax products',
        contact_name: 'Berly Couwer',
        contact_phone: '8389928383',
        credit_accepted: false
      }

      expect(Vendor.count).to eq(0)
      expect{ post api_v0_vendors_path,
        headers: JSON_HEADER,
        params: JSON.generate(vendor: vendor_params) }
        .to change(Vendor, :count).by(1)
      expect(Vendor.count).to eq(1)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_vendor = Vendor.last

      expect(created_vendor.name).to eq(vendor_params[:name])
      expect(created_vendor.description).to eq(vendor_params[:description])
      expect(created_vendor.contact_name).to eq(vendor_params[:contact_name])
      expect(created_vendor.contact_phone).to eq(vendor_params[:contact_phone])
      expect(created_vendor.credit_accepted)
        .to eq(vendor_params[:credit_accepted])
    end
  end

  context 'has missing attributes' do
    it 'sends error details' do
      create(:vendor)

      vendor_params = {
        name: 'Buzzy Bees',
        description: 'local honey and wax products',
        credit_accepted: false
      }

      expect(Vendor.count).to eq(1)
      expect{ post api_v0_vendors_path,
        headers: JSON_HEADER,
        params: JSON.generate(vendor: vendor_params) }
        .to change(Vendor, :count).by(0)
      expect(Vendor.count).to eq(1)

      last_vendor = Vendor.last

      expect(last_vendor.name).to_not eq(vendor_params[:name])
      expect(last_vendor.description).to_not eq(vendor_params[:description])

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Validation failed: Contact name can't be blank, Contact phone can't be blank")
    end
  end
end
