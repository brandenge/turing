class DishesController < ApplicationController
  before_action :find_dish, only: [:show]

  def show
    @dish = Dish.find(params[:id])
  end

  private

  def find_dish
    @dish = Dish.find(params[:id])
  end
end
