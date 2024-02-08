require 'rspec'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before(:each) do
    @cards_1 = CardGenerator.new('data/cards.txt')
    @cards_2 = CardGenerator.new('data/cards_2.txt')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@cards_1).to be_a(CardGenerator)
    end

    it 'also exists' do
      expect(@cards_2).to be_a(CardGenerator)
    end
  end

  describe '#cards' do
    it 'returns an array of cards' do
      expect(@cards_1.cards.all?{ |card| card.is_a?(Card)}).to eq(true)
    end

    it 'returns a different array of cards' do
      expect(@cards_2.cards.all?{ |card| card.is_a?(Card)}).to eq(true)
    end

    it 'creates the cards with the correct attributes' do
      last_card = @cards_1.cards.last
      expect(last_card.question).to eq('What cardboard cutout lives at Turing?')
      expect(last_card.answer).to eq('Justin Bieber')
      expect(last_card.category).to eq(:PopCulture)
    end

    it 'creates a different set of cards with the correct attributes' do
      last_card = @cards_2.cards.last
      expect(last_card.question).to eq('What is 2 + 2 equal to?')
      expect(last_card.answer).to eq('4')
      expect(last_card.category).to eq(:STEM)
    end
  end
end
