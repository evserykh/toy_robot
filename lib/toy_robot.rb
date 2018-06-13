class ToyRobot
  attr_accessor :row, :column, :direction, :table

  def on_table?
    !table.nil?
  end
end
