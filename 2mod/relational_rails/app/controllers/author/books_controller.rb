class Author::BooksController < ApplicationController
  def index
    @author = Author.find(book_params[:author_id])
    @books =
    case
    when params[:sort_by].present?
      @author.books.order(params[:sort_by])
    when params[:page_count_filter].present?
      @author.books.where("page_count > #{params[:page_count_filter]}")
    when params[:exact_match_title].present?
      @author.books.where(title: params[:exact_match_title])
    when params[:search_title].present?
      @author.books.where("LOWER(title) LIKE '%#{params[:search_title]}%'")
    else
      @author.books
    end
  end

  def new
    @author = Author.find(book_params[:author_id])
  end

  def create
    book = Book.new(book_params)

    if book.save
      redirect_to "/authors/#{book_params[:author_id]}/books"
    else
      redirect_to "/authors/#{book_params[:author_id]}/books/new"
      flash[:alert] = "Error: #{error_message(book.errors)}"
    end
  end
end
