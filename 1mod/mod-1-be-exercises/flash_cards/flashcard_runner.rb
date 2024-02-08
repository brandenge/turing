require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new('data/cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  card_count = round.deck.cards.count
  welcome(card_count)
  round.deck.cards.each do |card|
    take_turn(card, round)
    ask_question(round)
  end
  game_over(round)
end

def welcome(card_count)
  puts <<~INTRO
    Welcome! You're playing with #{card_count} cards.
    -------------------------------------------------
  INTRO
end

def take_turn(card, round)
  puts <<~TURN
    This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}.
    Question: #{card.question}
  TURN
end

def ask_question(round)
  guess = gets.chomp
  turn = round.take_turn(guess)
  puts turn.feedback
end

def game_over(round)
  puts '****** Game over! ******'
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."

  round.deck.cards.map{ |card| card.category }.uniq.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
end

start(round)
