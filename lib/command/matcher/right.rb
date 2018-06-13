require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Right
      include Base

      def match?
        command == 'RIGHT'
      end
    end
  end
end
