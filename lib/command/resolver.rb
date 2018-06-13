module Command
  class Resolver
    attr_reader :robot, :table, :commands

    def initialize(robot:, table:)
      @robot = robot
      @table = table
      @commands = []
    end

    def resolve(cmd_line)
      commands.each do |elem|
        matcher_klass, command_klass = elem.to_a.flatten
        matcher = matcher_klass.new(command: cmd_line)
        if matcher.match?
          options = default_options.merge(matcher.options)
          return command_klass.new(options)
        end
      end

      nil
    end

    private

    def default_options
      { robot: robot, table: table }
    end
  end
end
