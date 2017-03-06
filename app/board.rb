require './cell'
require 'pry'
require 'io/console'
class Board

  def initialize(collumns = 80, rows = 20)
    @board = create_board(collumns, rows)
  end

  def create_board(collumns, rows)
    (1..rows).collect do |row|
      (1..collumns).collect do |collumn|
        Cell.new(row, collumn)
      end
    end
  end

  def start_game
    loop do
      show_board
      binding.pry
      play_action
      sleep(0.5)
    end
  end

  def show_board
    system "clear"
    @board.each do |row|
      puts ''
      row.each do |element|
        print element.result
        element.find_neighbours(@board)
      end
    end
  end

  def play_action
    @board.each do |row|
      row.each do |element|
        element.play_move
      end;
    end
  end
end
binding.pry
b = Board.new
b.start_game
