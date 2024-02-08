class DiscountsController < ApplicationController
  before_action :find_merchant
  before_action :find_discount, only: [:show, :edit, :update, :destroy]

  def index
    @upcoming_holidays = get_url('https://date.nager.at/api/v3/NextPublicHolidays/US').first(3)
  end

  def new
    @discount = Discount.new
  end

  def create
    discount = Discount.new(discount_params.merge(merchant: @merchant))
    if discount.save
      redirect_to merchant_discounts_path(@merchant.id), notice: "Discount successfully saved!"
    else
      flash.now[:alert] = "Error: #{discount.errors.full_messages.join(', ')}"
      @discount = Discount.new
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @discount.has_pending_invoices?
      flash.now[:alert] = "Error: This discount has pending invoices and therefore cannot be updated."
      render :edit
    elsif @discount.update(discount_params)
      redirect_to merchant_discount_path(@merchant, @discount), notice: "Discount successfully updated!"
    else
      flash.now[:alert] = "Error: #{@discount.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    if @discount.has_pending_invoices?
      redirect_to merchant_discounts_path(@merchant.id), alert: "Error: This discount has pending invoices and therefore cannot be deleted."
    else
      @discount.destroy
      redirect_to merchant_discounts_path(@merchant.id), notice: "Discount successfully deleted!"
    end
  end

  private

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_discount
    @discount = @merchant.discounts.find(params[:id])
  end

  def discount_params
    params.require(:discount).permit(:percentage, :quantity)
  end

  def get_url(url)
    response = HTTParty.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
