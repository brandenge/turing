class Book < ApplicationRecord
  validates_presence_of :title, :publisher, :publication_date, :page_count
  validates :page_count, numericality: true, length: { minimum: 0 }
  validates :is_in_print, exclusion: [nil, ""]

  belongs_to :author

  def self.in_print
    Book.where(is_in_print: true)
  end

  def self.exact_match_title(title)
    Book.where(title: title)
  end

  def self.search_title(title)
    Book.where('title ILIKE ?', "%#{title}%")
  end
end
