require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :citation_count }
    it { should validate_numericality_of(:citation_count) }
    it { should validate_length_of(:citation_count) }
    it { should validate_exclusion_of(:is_alive).in_array([nil, ""]) }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'class methods' do
    describe '::sort_by_created_at' do
      it 'sorts all the authors by their created at timestamp in ascending order' do
        expect(Author.sort_by_created_at).to eq([@gabor_mate, @malcolm_gladwell, @seth_godin, @jrr_tolkien])
      end
    end

    describe '::sort_by_book_count' do
      it 'sorts all the authors by their created at timestamp in ascending order' do
        expect(Author.sort_by_book_count).to eq([@seth_godin, @malcolm_gladwell, @jrr_tolkien, @gabor_mate])
      end
    end

    describe '::exact_match_name' do
      it 'gets the author with the given name, if any' do
        expect(Author.exact_match_name(@jrr_tolkien.name)).to eq([@jrr_tolkien])
      end

      it 'returns an empty array if there is no match' do
        expect(Author.exact_match_name('Cal Newport')).to eq([])
      end
    end

    describe '::search_name' do
      it 'gets the author with the given name, if any' do
        expect(Author.search_name('gabor')).to eq([@gabor_mate])
      end

      it 'returns an empty array if there is no match' do
        expect(Author.search_name('Cal Newport')).to eq([])
      end
    end
  end

  describe 'instance methods' do
    describe '#book_count' do
      it 'returns the book count for a given author' do
        expect(@gabor_mate.book_count).to eq(5)
        expect(@malcolm_gladwell.book_count).to eq(7)
        expect(@seth_godin.book_count).to eq(9)
        expect(@jrr_tolkien.book_count).to eq(6)
      end
    end
  end
end
