require './lib/game/board'
require './lib/game/player'

class Game
  def initialize
    @players = [
      Player.new('Player 1', :white),
      Player.new('Player 2', :black)
    ]
    @board = Board.new
  end

  def start
    @board.render
    until game_over?
      @players.each do |player|
        break if game_over?
        move = player.move
        @board.update(move, player.color)
        @board.render
      end
    end
  end

  def game_over?
    false
  end
end
