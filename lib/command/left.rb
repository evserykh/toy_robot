require File.expand_path('base', __dir__)

module Command
  class Left < Base
    private

    def action
      robot.direction = robot.direction.left
    end
  end
end
