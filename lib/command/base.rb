module Command
  module Base
    def self.included(base)
      base.class_eval do
        attr_reader :robot
      end
    end

    def initialize(options)
      @robot = options.fetch(:robot)
    end

    def execute
      return unless robot.on_table?
      action
    end

    private

    def action
      raise NotImplementedError, "Implement #{self.class.name}##{__method__} method"
    end
  end
end
