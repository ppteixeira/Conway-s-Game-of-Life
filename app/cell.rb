class Cell
  attr_accessor :cell_col, :cell_row, :state, :neighbours_alive

  def initialize(row, collumn)
    @cell_col = collumn
    @cell_row = row
    @state = ['ON','OFF','OFF'].sample
    @neighbours_alive = 0
  end

  def result
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
    (cell_row-1..cell_row+1).each do |row|
      if row >= 0 && row <= 19
        (cell_col - 1..cell_col + 1).each do |collumn|
          if collumn >= 0 && collumn <= 79
            if row == cell_row && collumn == cell_col
            else
              if board[row][collumn].is_on?
                @neighbours_alive += 1
              end
            end
          end
        end
      end
    end
  end

  def play_move
    case is_on?
    when true
      turn_off if @neighbours_alive < 2 || @neighbours_alive > 3
    when false
      turn_on if @neighbours_alive == 3
    end
  end
end
