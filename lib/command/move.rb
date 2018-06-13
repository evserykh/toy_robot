require File.expand_path('../movement', __dir__)
require File.expand_path('base', __dir__)

module Command
  class Move
    include Base

    private

    def table
      robot.table
    end

    def movement
      @movement ||= Movement.new(row: robot.row, column: robot.column, direction: robot.direction)
    end

    def action
      movement.execute
      return unless table.include?(movement.row, movement.column)

      robot.row = movement.row
      robot.column = movement.column
    end
  end
end
