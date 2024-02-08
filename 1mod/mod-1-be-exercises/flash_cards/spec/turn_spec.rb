require 'rspec'
require_relative '../lib/turn'
require_relative '../lib/card'

RSpec.describe Turn do
  before(:each) do
    @card_1 = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    @card_2 = Card.new('What is 2 + 2 equal to?', '4', :Math)
    @turn_1 = Turn.new('Saturn', @card_1)
    @turn_2 = Turn.new('Mercury', @card_1)
    @turn_3 = Turn.new('4', @card_2)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@turn_1).to be_instance_of(Turn)
    end

    it 'still exists' do
      expect(@turn_2).to be_instance_of(Turn)
    end

    it 'still exists again' do
      expect(@turn_3).to be_instance_of(Turn)
    end
  end

  describe '#card' do
    it 'has a card' do
      expect(@turn_1.card).to be(@card_1)
    end

    it 'has a different card' do
      expect(@turn_3.card).to be(@card_2)
    end
  end

  describe '#guess' do
    it 'has a guess' do
      expect(@turn_1.guess).to eq('Saturn')
    end

    it 'has a different guess' do
      expect(@turn_2.guess).to eq('Mercury')
    end

    it 'has a different guess again' do
      expect(@turn_3.guess).to eq('4')
    end
  end

  describe '#correct?' do
    it 'guesses correctly' do
      expect(@turn_2.correct?).to eq(true)
    end

    it 'guesses incorrectly ' do
      expect(@turn_1.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    it 'gives feedback for correct guesses' do
      expect(@turn_2.feedback).to eq('Correct!')
    end

    it 'gives feedback for incorrect guesses' do
      expect(@turn_1.feedback).to eq('Incorrect.')
    end
  end
end
