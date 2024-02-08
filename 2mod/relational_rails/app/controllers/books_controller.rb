class BooksController < ApplicationController
  def index
    @books =
    case
    when params[:exact_match_title].present?
      Book.exact_match_title(params[:exact_match_title])
    when params[:search_title].present?
      Book.search_title(params[:search_title])
    else
      Book.in_print
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to "/books/#{book.id}"
    else
      redirect_to "/books/#{book.id}/edit"
      flash[:alert] = "Error: #{error_message(pet.errors)}"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
end
