require_relative 'cell'
require 'json'

class Board
  def initialize(customized = false ,columns = 80, rows = 20)
    @board = create_board(rows, columns, customized)
    customized ? set_custom_board : start_game
  end

  def create_board(rows, columns, customized)
    (0...rows).collect do |row|
      (0...columns).collect do |column|
        Cell.new(row, column, customized)
      end
    end
  end

  def set_custom_board
    points = JSON.parse(File.read("data/glider_gun.json"))
    points.each do |row,column|
      @board[row][column].turn_on
    end
    start_game
  end

  def start_game
    loop do
      sleep(0.5)
      show_board
      look_neighbours
      play_one_round
    end
  end

  def show_board
    system "clear"
    @board.each do |row|
      #best way I found to go to next line, but there might be better ways
      puts ''
      row.each do |element|
        print element.print_on_screen
      end
    end
  end

  # The core command coul be implemented inside show_board but it would not have
  # separation of concerns, although it would require less loops.
  # But definitely must be called before play_one_round
  def look_neighbours
    @board.each do |row|
      row.each do |element|
         element.find_neighbours(@board)
      end
    end
  end

  def play_one_round
    @board.each do |row|
      row.each do |element|
        element.play_next_move
      end
    end
  end
end
