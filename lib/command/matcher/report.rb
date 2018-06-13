require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Report
      include Base

      def match?
        command == 'REPORT'
      end
    end
  end
end
