require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Left < Base
      def match?
        command == 'LEFT'
      end
    end
  end
end
