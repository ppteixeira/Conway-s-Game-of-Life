require './cell'
require 'pry'
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
      print show_board
      sleep 0.5
    end
  end

  def show_board
    system "clear"
    @board.each do |row|
      puts ''
      row.each do |element|
        print element.result
      end; nil
    end
  end
end

b = Board.new
b.show_board
