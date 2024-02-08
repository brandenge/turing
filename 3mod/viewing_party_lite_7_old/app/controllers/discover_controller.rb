class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_dashboard_id])
  end
end
