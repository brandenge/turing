class Book
  attr_reader :author,
              :title,
              :publication_year

  def initialize(
    author_first_name:,
    author_last_name:,
    title:,
    publication_date:
  )
    @author = "#{author_first_name} #{author_last_name}"
    @title = title
    @publication_year = publication_date[-4..-1]
  end
end
