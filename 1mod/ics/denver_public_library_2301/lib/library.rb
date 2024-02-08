class Library
  attr_reader :name,
              :authors,
              :books

  def initialize(name:)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @books.append(*author.books)
    @authors << author
  end

  def publication_time_frame_for(author)
    sorted_books = author.books.sort_by { |book| book.publication_year.to_i }
    {
      start: sorted_books.first.publication_year,
      end: sorted_books.last.publication_year
    }
  end
end
