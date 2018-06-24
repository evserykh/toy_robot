require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Move < Base
      def match?
        command == 'MOVE'
      end
    end
  end
end
