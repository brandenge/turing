class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.markets
  end

  def show
    @market = MarketFacade.new.market(params[:id])
  end

  def search
    @search_results = MarketFacade.new.search(
      name: params[:name],
      city: params[:city],
      state: params[:state]
    )
    if @search_results[:errors]
      flash.now[:error] = @search_results[:errors]
    end
    @vendor = VendorFacade.new.vendor(params[:vendor_id])
    render 'vendors/show'
  end
end
