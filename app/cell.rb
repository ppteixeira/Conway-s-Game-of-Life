class Cell

  attr_accessor :cell_col , :cell_row

  def initialize(row, column)
    @cell_col = column
    @cell_row = row
    @state = ['ON','OFF','OFF'].sample
    @neighbours_alive = 0
  end

  def print_on_screen
    is_on? ? "#" : "\s"
  end

  def is_on?
    @state == 'ON'
  end

  def turn_on
    @state = 'ON'
  end

  def turn_off
    @state = 'OFF'
  end

  def find_neighbours(board)
    @neighbours_alive = 0
    #Maybe it could be done better , but limiting to the size of the board
    # requires to have extra if statements
    (cell_row-1..cell_row+1).each do |row|
      if row >= 0 && row < board.size
        (cell_col - 1..cell_col + 1).each do |column|
          if column >= 0 && column < board[row].size
            unless row == cell_row && column == cell_col
              @neighbours_alive += 1 if board[row][column].is_on?
            end
          end
        end
      end
    end
  end

  def play_next_move
    case is_on?
    when true
      turn_off if @neighbours_alive < 2 || @neighbours_alive > 3
    when false
      turn_on if @neighbours_alive == 3
    end
  end
end
