require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :publisher }
    it { should validate_presence_of :publication_date }
    it { should validate_presence_of :page_count }
    it { should validate_numericality_of(:page_count) }
    it { should validate_length_of(:page_count) }
    it { should validate_exclusion_of(:is_in_print).in_array([nil, ""]) }
  end

  describe "relationships" do
    it { should belong_to :author }
  end

  describe '::in_print' do
    it 'selects only books that are still in print' do
      expect(Book.in_print).to eq([@book1_1, @book1_2, @book1_3, @book1_4, @book1_5, @book2_1, @book2_2, @book2_3, @book2_4, @book2_5, @book2_6, @book2_7, @book3_2, @book3_4, @book3_5, @book3_6, @book3_7, @book3_8, @book3_9, @book4_2, @book4_3, @book4_4, @book4_5, @book4_6])
    end
  end

  describe '::exact_match_title' do
    it 'gets the book with the exact title' do
      expect(Book.exact_match_title('The Silmarillion')).to eq([@book4_6])
    end
  end

  describe '::search_title' do
    it 'searches for books by their title' do
      expect(Book.search_title('Market')).to eq([@book3_2, @book3_5])
    end
  end
end
