class ApplicationController < ActionController::Base
  before_action :set_logo
  def welcome
  end

  def set_logo
    photo = PhotoSearch.new
    @logo = photo.logo
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
