require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Report < Base
      def match?
        !match.nil?
      end

      def options
        { format: match['format'] }
      end

      private

      def match
        @match ||= command.match(pattern)
      end

      def pattern
        /REPORT\s?(?<format>JSON|HTML)?/
      end
    end
  end
end
