require_relative '../pieces/pawn'
require_relative '../pieces/knight'
require_relative '../pieces/bishop'
require_relative '../pieces/rook'
require_relative '../pieces/queen'
require_relative '../pieces/king'

class Board
  attr_reader :squares

  def initialize
    @squares = initialize_board
  end

  def starting_row(color)
    [
      Rook.new(color),
      Knight.new(color),
      Bishop.new(color),
      King.new(color),
      Queen.new(color),
      Bishop.new(color),
      Knight.new(color),
      Rook.new(color)
    ]
  end

  def starting_pawns(color)
    [*1..8].map { Pawn.new(color) }
  end

  def initialize_board
    [
      starting_row(:white),
      starting_pawns(:white),
      [*1..8].map { nil },
      [*1..8].map { nil },
      [*1..8].map { nil },
      [*1..8].map { nil },
      starting_pawns(:black),
      starting_row(:black)
    ]
  end

  def update(move, color)
    from_column, from_row, to_column, to_row = move.split.map { |i| i.to_i }
    from_piece = @squares[from_row - 1][from_column - 1]
    @squares[from_row - 1][from_column - 1] = nil
    @squares[to_row - 1][to_column - 1] = from_piece
  end

  def render
    blocks = {
      line: "[0;37;5;40;100m#{' ' * 82}[0m",
      border: "[0;37;5;40;100m#{' ' * 2}[0m",
      white: "[0;37;5;47;107m#{' ' * 4}[0m",
      black: "[0;34;40m#{' ' * 4}[0m",
      green: "[0;5;43;42m#{' ' * 4}[0m",
      blue: "[0;36;5;44;104m#{' ' * 4}[0m",
      teal: "[0;5;36;46m#{' ' * 4}[0m",
      purple: "[0;1;34;45m#{' ' * 4}[0m",
      red: "[0;31;5;41;101m#{' ' * 4}[0m",
      yellow: "[0;5;1;31;43m#{' ' * 4}[0m",
    }

    padding = '      '
    puts "\n" * 4
    @squares.each do |row|
      puts padding + blocks[:line]
      row = row.map do |square|
        next blocks[:black] * 2 if square == nil
        piece = ''
        case square.class.to_s
          when 'Pawn' then piece += blocks[:green]
          when 'Rook' then piece += blocks[:blue]
          when 'Knight' then piece += blocks[:teal]
          when 'Bishop' then piece += blocks[:purple]
          when 'Queen' then piece += blocks[:red]
          when 'King' then piece += blocks[:yellow]
        end

        case square.color
          when :black then piece += blocks[:black]
          when :white then piece += blocks[:white]
        end
      end
      row = padding + blocks[:border] + row.join(blocks[:border]) + blocks[:border]
      puts "#{row}\n#{row}\n#{row}\n#{row}\n"
    end
    puts padding + blocks[:line]
    puts "\n\n"
  end
end
