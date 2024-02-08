require 'rspec'
require_relative '../lib/card'

RSpec.describe Card do
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('What is 2 + 2 equal to?', '4', :Math)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@card_1).to be_instance_of(Card)
    end

    it 'still exists' do
      expect(@card_2).to be_instance_of(Card)
    end
  end

  describe '#question' do
    it 'has a question' do
      expect(@card_1.question).to eq('What is the capital of Alaska?')
    end

    it 'has a different question' do
      expect(@card_2.question).to eq('What is 2 + 2 equal to?')
    end
  end

  describe '#answer' do
    it 'has an answer' do
      expect(@card_1.answer).to eq('Juneau')
    end

    it 'has a different answer' do
      expect(@card_2.answer).to eq('4')
    end
  end

  describe '#category' do
    it 'has a category' do
      expect(@card_1.category).to eq(:Geography)
    end

    it 'has a different category' do
      expect(@card_2.category).to eq(:Math)
    end
  end
end
