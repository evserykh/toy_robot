require File.expand_path('base', __dir__)

module Command
  class Right
    include Base

    private

    def action
      robot.direction = robot.direction.right
    end
  end
end
