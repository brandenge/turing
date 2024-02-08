class Author < ApplicationRecord
  validates_presence_of :name, :birthdate, :citation_count
  validates :citation_count, numericality: true, length: { minimum: 0 }
  validates :is_alive, exclusion: [nil, ""]

  has_many :books, dependent: :destroy

  def self.sort_by_book_count
    Author.joins(:books).order(book_count: :desc).group(:id).select(:name).select(:id).select("COUNT(books.id) AS book_count")
  end

  def book_count
    Book.where(author_id: id).count
  end
end
