require 'spec_helper'

RSpec.describe Author do
  subject { Author.new(AUTHOR_1) }
  let(:author) { Author.new(AUTHOR_2) }

  describe '#initialize' do
    it 'exists' do
      expect(subject).to be_a(Author)
      expect(author).to be_a(Author)
    end
  end

  describe 'attributes' do
    it 'has a name and books' do
      expected_1 = {
        name: "#{AUTHOR_1[:first_name]} #{AUTHOR_1[:last_name]}",
        books: []
      }
      expected_2 = {
        name: "#{AUTHOR_2[:first_name]} #{AUTHOR_2[:last_name]}",
        books: []
      }
      expect(subject).to have_attributes(expected_1)
      expect(author).to have_attributes(expected_2)
    end
  end

  describe '#write' do
    let(:book_1) { subject.write(BOOK_1[:title], BOOK_1[:publication_date]) }
    let(:book_2) { author.write(BOOK_2[:title], BOOK_2[:publication_date]) }

    it 'returns a Book object' do
      expect(book_1).to be_a(Book)
      expect(book_2).to be_a(Book)
    end

    it 'the returned book has the given title and publication year' do
      expect(book_1.title).to eq(BOOK_1[:title])
      expect(book_1.publication_year).to eq(BOOK_1[:publication_date][-4..-1])
      expect(book_2.title).to eq(BOOK_2[:title])
      expect(book_2.publication_year).to eq(BOOK_2[:publication_date][-4..-1])
    end

    it 'the author is the author of the book' do
      expected_1 = "#{BOOK_1[:author_first_name]} #{BOOK_1[:author_last_name]}"
      expected_2 = "#{BOOK_2[:author_first_name]} #{BOOK_2[:author_last_name]}"

      expect(book_1.author).to eq(expected_1)
      expect(book_2.author).to eq(expected_2)
    end

    it 'adds the book to the author\'s books' do
      expected_1 = "#{BOOK_1[:author_first_name]} #{BOOK_1[:author_last_name]}"
      expected_2 = "#{BOOK_2[:author_first_name]} #{BOOK_2[:author_last_name]}"

      expect(subject.books).to include(book_1)
      expect(author.books).to include(book_2)
    end
  end
end
