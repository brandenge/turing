class AuthorsController < ApplicationController
  def index
    @authors =
    case
    when params[:book_count].present?
      @sort_by_book_count = params[:book_count]
      Author.sort_by_book_count
    when params[:exact_match_name].present?
      Author.exact_match_name(params[:exact_match_name])
    when params[:search_name].present?
      Author.search_name(params[:search_name])
    else
      Author.sort_by_created_at
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def new

  end

  def create
    author = Author.new(author_params)
    if author.save
      redirect_to '/authors'
    else
      redirect_to '/authors/new'
      flash[:alert] = "Error: #{error_message(author.errors)}"
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    if author.update(author_params)
      redirect_to "/authors/#{author.id}"
    else
      redirect_to "/authors/#{author.id}/edit"
      flash[:alert] = "Error: #{error_message(author.errors)}"
    end
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

  private

  def author_params
    convert_params
    params.permit(:name, :birthdate, :is_alive, :citation_count)
  end

  def convert_params
    params[:is_alive] = convert_check_box(params[:is_alive])
    params[:citation_count] = params[:citation_count].to_i
  end
end
