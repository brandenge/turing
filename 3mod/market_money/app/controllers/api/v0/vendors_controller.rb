class Api::V0::VendorsController < ApplicationController
  def show
    vendor = Vendor.find(params[:id])
    render json: VendorSerializer.new(vendor).serializable_hash.to_json
  end

  def create
    vendor = Vendor.create!(strong_params)
    render json: VendorSerializer.new(vendor).serializable_hash.to_json, status: 201
  end

  def update
    vendor = Vendor.update!(params[:id], strong_params)
    render json: VendorSerializer.new(vendor).serializable_hash.to_json, status: 200
  end

  def destroy
    Vendor.destroy(params[:id])
    render body: nil, status: 204
  end

  private

  def strong_params
    params.require(:vendor).permit(:name, :description, :contact_name, :contact_phone, :credit_accepted)
  end
end
