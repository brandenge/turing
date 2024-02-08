require 'rspec'
require_relative '../lib/card'
require_relative '../lib/turn'
require_relative '../lib/deck'
require_relative '../lib/round'
require_relative '../lib/card_generator'

RSpec.describe Round do
  before(:each) do
    @cards_1 = CardGenerator.new('data/cards.txt').cards
    @cards_2 = CardGenerator.new('data/cards_2.txt').cards
    @deck_1 = Deck.new(@cards_1)
    @deck_2 = Deck.new(@cards_2)
    @round_1 = Round.new(@deck_1)
    @round_2 = Round.new(@deck_2)
    @turn_1 = @round_1.take_turn('10')
    @turn_2 = @round_1.take_turn('panda')
    @turn_3 = @round_2.take_turn('Juneau')
    @turn_4 = @round_2.take_turn('Mars')
    @turn_5 = @round_2.take_turn('Northwest')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@round_1).to be_instance_of(Round)
    end

    it 'still exists' do
      expect(@round_2).to be_instance_of(Round)
    end
  end

  describe '#deck' do
    it 'has a deck' do
      expect(@round_1.deck).to be(@deck_1)
    end

    it 'has a different deck' do
      expect(@round_2.deck).to be(@deck_2)
    end
  end

  describe '#current_card' do
    it 'has a current card' do
      round = Round.new(@deck_1)
      expect(round.current_card).to be(@deck_1.cards[0])
    end

    it 'has a different current card' do
      round = Round.new(@deck_1)
      round.take_turn('Juneau')

      expect(round.current_card).to be(@deck_1.cards[1])
    end
  end

  describe '#take_turn' do
    it 'can take a turn' do
      @round_1.take_turn('Adam')
      expect(@round_1.turns.count).to eq(3)
    end

    it 'can take another turn' do
      @round_1.take_turn('Adam')
      expect(@round_1.turns.count).to eq(3)
      expect(@round_1.current_card).to be(@round_1.deck.cards[3])

      @round_1.take_turn('Mercury')
      expect(@round_1.turns.count).to eq(4)
    end
  end

  describe '#turns' do
    it 'starts with no turns' do
      round = Round.new(@deck_1)
      expect(round.turns).to eq([])
    end

    it 'has a series of turns' do
      round = Round.new(@deck_1)
      turn = round.take_turn('Juneau')
      expect(round.turns).to eq([turn])
    end

    it 'has a different series of turns' do\
      expect(@round_1.turns).to eq([@turn_1, @turn_2])
    end
  end

  describe '#number_correct' do
    it 'returns the number of correct guesses in the round' do
      expect(@round_1.number_correct).to eq(1)
    end

    it 'returns a different number of correct guesses in another round' do
      expect(@round_2.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct guesses by category' do
      expect(@round_2.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'returns the number of correct guesses by another category' do
      expect(@round_2.number_correct_by_category(:STEM)).to eq(1)
    end
  end

  describe '#percent_correct' do
    it 'returns the percentage of correct guesses overall' do
      expect(@round_1.percent_correct).to eq(50.0)
    end

    it 'returns a different percentage of correct guesses overall' do
      expect(@round_2.percent_correct).to eq(66.7)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns the percentage of correct guesses by category' do
      expect(@round_2.percent_correct_by_category(:Geography)).to eq(100.0)
    end

    it 'returns a different percentage of correct guesses by category' do
      expect(@round_2.percent_correct_by_category(:STEM)).to eq(50.0)
    end
  end
end
