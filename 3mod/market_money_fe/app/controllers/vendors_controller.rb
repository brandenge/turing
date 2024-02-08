class VendorsController < ApplicationController
  def show
    @vendor = VendorFacade.new.vendor(params[:id])
  end
end
