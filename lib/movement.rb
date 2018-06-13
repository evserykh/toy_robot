class Movement
  attr_accessor :row, :column, :direction

  def initialize(row:, column:, direction:)
    @row = row
    @column = column
    @direction = direction
  end

  def execute
    move_north if direction.north?
    move_east if direction.east?
    move_south if direction.south?
    move_west if direction.west?
  end

  private

  def move_north
    self.column += 1
  end

  def move_east
    self.row += 1
  end

  def move_south
    self.column -= 1
  end

  def move_west
    self.row -= 1
  end
end
