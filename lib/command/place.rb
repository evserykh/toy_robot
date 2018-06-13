require File.expand_path('base', __dir__)

module Command
  class Place
    attr_reader :robot, :table, :row, :column, :direction

    def initialize(options)
      @robot = options.fetch(:robot)
      @table = options.fetch(:table)
      @row = options.fetch(:row)
      @column = options.fetch(:column)
      @direction = options.fetch(:direction)
    end

    def execute
      return unless table.include?(row, column)

      robot.table = table
      robot.row = row
      robot.column = column
      robot.direction = direction
    end
  end
end
