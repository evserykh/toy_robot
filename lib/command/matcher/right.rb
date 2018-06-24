require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Right < Base
      def match?
        command == 'RIGHT'
      end
    end
  end
end
