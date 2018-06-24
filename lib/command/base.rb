require File.expand_path('../command', __dir__)

module Command
  class Base
    attr_reader :robot

    def initialize(options)
      @robot = options.fetch(:robot)
    end

    def execute
      raise RobotNotOnTableError, "The robot isn't on a table" unless robot.on_table?
      action
    end

    private

    def action
      raise NotImplementedError, "Implement #{self.class.name}##{__method__} method"
    end
  end
end
