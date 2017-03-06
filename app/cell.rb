class Cell
  attr_accessor :cell_x, :cell_y, :neighbours_alive

  def initialize(x, y)
    @cell_x = x
    @cell_y = y
    @state = ['ON','OFF','OFF','OFF'].sample
    @neighbours_alive = []
  end

  def result
    is_on? ? "\u25A3" : "\s"
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
    (cell_y-1..cell_y+1).each do |row|
      if row > 0 && row <= 20
        (cell_x-1..cell_x+1).each do |collumn|
          if collumn > 0 && collumn <= 80
            if row != cell_x && collumn != cell_y
              neighbours_alive << board[row][collumn] if board[row][collumn].is_on?
            end
          end
        end
      end
    end
    neighbours_alive
  end

  def play_move
    case is_on?
    when true
      turn_off if neighbours_alive.size < 2 || neighbours_alive.size > 3
    when false
      turn_on if neighbours_alive.size == 3
    end
  end
end
