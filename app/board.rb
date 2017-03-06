require './cell'
require 'pry'
class Board

  def initialize(collumns = 80, rows = 20)
    @board = create_board(rows, collumns)
  end

  def create_board(rows, collumns)
    (0...rows).collect do |row|
      (0...collumns).collect do |collumn|
        Cell.new(row, collumn)
      end
    end
  end

  def start_game
    loop do
      show_board
      look_neighbours
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
      end
    end
  end

  def look_neighbours
    @board.each do |row|
      row.each do |element|
         element.find_neighbours(@board)
      end
    end
  end

  def play_action
    @board.each do |row|
      row.each do |element|
        element.play_move
      end
    end
  end
end
b = Board.new
b.start_game
