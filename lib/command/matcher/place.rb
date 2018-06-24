require File.expand_path('../../direction', __dir__)
require File.expand_path('base', __dir__)

module Command
  module Matcher
    class Place < Base
      attr_reader :directions

      def initialize(options)
        super
        @directions = options.fetch(:directions, Direction::VALUES)
      end

      def match?
        !match.nil?
      end

      def options
        direction = Direction.parse(match['direction'])
        { row: match['row'].to_i, column: match['column'].to_i, direction: direction }
      end

      private

      def match
        @match ||= command.match(pattern)
      end

      def pattern
        /PLACE (?<row>\d+),(?<column>\d+),(?<direction>#{directions.join('|')})/
      end
    end
  end
end
