class Board

  attr_reader :collumns , :rows
  def initialize(collumns = 80, rows = 20)
    @collums = collumns
    @rows = rows
  end
end
