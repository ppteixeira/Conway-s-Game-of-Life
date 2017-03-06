class Cell
  attr_accessor :cell_col, :cell_row, :neighbours_alive

  def initialize(row, collumn)
    @cell_col = collumn
    @cell_row = row
    @state = ['ON','OFF','OFF','OFF'].sample
    @neighbours_alive = []
  end

  def result
    is_on? ? "O" : "\s"
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
    neighbours_alive.clear
    (cell_row-1..cell_row+1).each do |row|
      if row >= 0 && row < 20
        (cell_col-1..cell_col+1).each do |collumn|
          if collumn >= 0 && collumn < 80
            if row != cell_row && collumn != cell_col
              if board[row][collumn] == nil
              end
              neighbours_alive << board[row][collumn] if board[row][collumn].is_on?
            end
          end
        end
      end
    end
    neighbours_alive
  end

  def play_move
    binding.pry
    case is_on?
    when true
      turn_off if neighbours_alive.size < 2 || neighbours_alive.size > 3
    when false
      turn_on if neighbours_alive.size == 3
    end
  end
end
