require 'spec_helper'

RSpec.describe Book do
  subject { Book.new(BOOK_1) }
  let(:book) { Book.new(BOOK_2) }

  describe '#initialize' do
    it 'exists' do
      expect(subject).to be_a(Book)
      expect(book).to be_a(Book)
    end
  end

  describe ('attributes') do
    it 'has an author, title, and publication year' do
      expected_1 = {
        author: "#{BOOK_1[:author_first_name]} #{BOOK_1[:author_last_name]}",
        title: BOOK_1[:title],
        publication_year: BOOK_1[:publication_date][-4..-1]
      }

      expected_2 = {
        author: "#{BOOK_2[:author_first_name]} #{BOOK_2[:author_last_name]}",
        title: BOOK_2[:title],
        publication_year: BOOK_2[:publication_date][-4..-1]
      }
      expect(subject).to have_attributes(expected_1)
      expect(book).to have_attributes(expected_2)
    end
  end
end
