require 'spec_helper'

RSpec.describe Library do
  subject { Library.new(LIBRARY_1) }
  let(:library) { Library.new(LIBRARY_2) }

  let(:author_1) { Author.new(AUTHOR_1) }
  let(:author_2) { Author.new(AUTHOR_2) }
  let(:author_3) { Author.new(AUTHOR_3) }

  let!(:book_1) { author_1.write(BOOK_1[:title], BOOK_1[:publication_date]) }
  let!(:book_2) { author_2.write(BOOK_2[:title], BOOK_2[:publication_date]) }
  let!(:book_3) { author_3.write(BOOK_3[:title], BOOK_3[:publication_date]) }
  let!(:book_4) { author_3.write(BOOK_4[:title], BOOK_4[:publication_date]) }

  describe '#initialize' do
    it '#exists' do
      expect(subject).to be_a(Library)
      expect(library).to be_a(Library)
    end
  end

  describe 'attributes' do
    it 'has a name, books, and authors' do
      expected_1 = {
        name: LIBRARY_1[:name],
        authors: [],
        books: []
      }
      expected_2 = {
        name: LIBRARY_2[:name],
        authors: [],
        books: []
      }
      expect(subject).to have_attributes(expected_1)
      expect(library).to have_attributes(expected_2)
    end
  end

  describe '#add_author' do
    it 'adds an author to the array of authors' do
      subject.add_author(author_1)
      expect(subject.authors).to include(author_1)

      subject.add_author(author_2)
      expect(subject.authors).to include(author_1, author_2)

      library.add_author(author_1)
      expect(library.authors).to include(author_1)
      library.add_author(author_2)
      expect(library.authors).to include(author_1, author_2)
      library.add_author(author_3)
      expect(library.authors).to include(author_1, author_2, author_3)
    end

    it 'adds the author\'s books to the array of books' do
      subject.add_author(author_1)
      expect(subject.books).to include(book_1)
      subject.add_author(author_2)
      expect(subject.books).to include(book_1, book_2)

      library.add_author(author_1)
      expect(library.books).to include(book_1)
      library.add_author(author_2)
      expect(library.books).to include(book_1, book_2)
      library.add_author(author_3)
      expect(library.books).to include(book_1, book_2, book_3, book_4)
    end

    it 'returns the array of authors' do
      subject.add_author(author_1)
      expect(subject.authors).to eq([author_1])
      subject.add_author(author_2)
      expect(subject.authors).to eq([author_1, author_2])
      subject.add_author(author_3)
      expect(subject.authors).to eq([author_1, author_2, author_3])
    end
  end

  describe '#publication_time_frame_for' do
    it 'returns a hash' do
      subject.add_author(author_1)
      expect(subject.publication_time_frame_for(author_1)).to be_a(Hash)
      library.add_author(author_2)
      expect(library.publication_time_frame_for(author_2)).to be_a(Hash)
    end

    it 'the start and end keys of the hash have the first and last publication years of the author, respectively' do
      expected_1 = {
        start: book_1.publication_year,
        end: book_1.publication_year
      }
      expected_2 = {
        start: book_2.publication_year,
        end: book_2.publication_year
      }
      expected_3 = {
        start: book_3.publication_year,
        end: book_4.publication_year
      }

      subject.add_author(author_1)
      expect(subject.publication_time_frame_for(author_1)).to eq(expected_1)

      subject.add_author(author_2)
      expect(subject.publication_time_frame_for(author_2)).to eq(expected_2)

      library.add_author(author_3)
      expect(library.publication_time_frame_for(author_3)).to eq(expected_3)
    end
  end
end
