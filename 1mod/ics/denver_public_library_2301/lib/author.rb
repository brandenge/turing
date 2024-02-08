require './lib/book'

class Author
  attr_reader :name,
              :books

  def initialize(first_name:, last_name:)
    @name = "#{first_name} #{last_name}"
    @books = []
  end

  def write(title, publication_date)
    args = {
      author_first_name: @name.split.first,
      author_last_name: @name.split.last,
      title: title,
      publication_date: publication_date
    }
    new_book = Book.new(args)
    @books << new_book
    new_book
  end
end
