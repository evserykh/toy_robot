module Command
  module Matcher
    class Base
      attr_reader :command

      def initialize(options)
        @command = options.fetch(:command)
      end

      def match?
        raise NotImplementedError, "Implement #{self.class.name}##{__method__} method"
      end

      def options
        {}
      end
    end
  end
end
