class ChefsController < ApplicationController
  before_action :find_chef, only: [:show]

  def show

  end

  private

  def find_chef
    @chef = Chef.find(params[:id])
  end
end
