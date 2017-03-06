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
end

binding.pry
