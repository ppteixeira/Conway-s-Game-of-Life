class Cell
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @state = ['ON','OFF','OFF','OFF'].sample
  end

  def result
    is_on? ? 'O' : "\s"
  end

  def is_on?
    @state == 'ON'
  end

  def change_state
    is_on? ? turn_off : turn_on
  end


end
