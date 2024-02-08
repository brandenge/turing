class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if @application.accepted?
      @application.update(status: "Accepted")
      @application.set_pets_adopted
    elsif @application.rejected?
      @application.update(status: "Rejected")
    end
  end
end
