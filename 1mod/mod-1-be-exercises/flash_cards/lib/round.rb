require_relative './turn'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @current_card_index += 1
    new_turn
  end

  def number_correct
    correct_turns.count
  end

  def number_correct_by_category(category)
    correct_turns.filter{ |turn| turn.card.category == category }.count
  end

  def percent_correct
    (number_correct.fdiv(@turns.count) * 100).round(1)
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    total = @turns.filter{ |turn| turn.card.category == category }.count
    (correct.fdiv(total) * 100).round(1)
  end

  private

  def correct_turns
    @turns.filter{ |turn| turn.correct? }
  end
end
