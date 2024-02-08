class Chef::IngredientsController < ApplicationController
  before_action :find_chef, only: [:index]

  def index
    @chef_ingredients = @chef.ingredients
  end

  private

  def find_chef
    @chef = Chef.find(params[:chef_id])
  end
end
