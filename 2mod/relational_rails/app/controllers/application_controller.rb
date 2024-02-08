class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
  end

  def convert_check_box(check_box_value)
    case check_box_value
    when '0' then false
    when '1' then true
    end
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def book_params
    params.permit(:title, :subtitle, :publisher, :publication_date, :is_in_print, :page_count, :author_id)
  end

  def convert_book_params
    params[:is_in_print] = convert_check_box(params[:is_in_print])
    params[:page_count] = params[:page_count].to_i
  end
end
