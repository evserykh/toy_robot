require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Move
      include Base

      def match?
        command == 'MOVE'
      end
    end
  end
end
