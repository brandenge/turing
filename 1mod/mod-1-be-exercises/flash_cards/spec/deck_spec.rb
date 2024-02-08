require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/card_generator'

RSpec.describe Deck do
  before(:each) do
    @cards_1 = CardGenerator.new('data/cards.txt').cards
    @cards_2 = CardGenerator.new('data/cards_2.txt').cards
    @deck_1 = Deck.new(@cards_1)
    @deck_2 = Deck.new(@cards_2)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@deck_1).to be_instance_of(Deck)
    end

    it 'still exists' do
      expect(@deck_2).to be_instance_of(Deck)
    end
  end

  describe '#cards' do
    it 'has cards' do
      expect(@deck_1.cards).to eq(@cards_1)
    end

    it 'has different cards' do
      expect(@deck_2.cards).to eq(@cards_2)
    end
  end

  describe '#count' do
    it 'has a count' do
      expect(@deck_1.cards.count).to eq(4)
    end

    it 'has a different count' do
      expect(@deck_2.cards.count).to eq(5)
    end
  end

  describe '#cards_in_category' do
    it 'returns cards by category' do
      expect(@deck_2.cards_in_category(:STEM).count).to eq(4)
    end

    it 'returns cards by a different category' do
      expect(@deck_2.cards_in_category(:Geography).count).to eq(1)
    end

    it 'returns an empty array if no cards in the category are found' do
      expect(@deck_2.cards_in_category(:'Pop Culture')).to eq([])
    end
  end
end
