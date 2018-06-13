module Command
  module Matcher
    module Base
      def self.included(base)
        base.class_eval do
          attr_reader :command
        end
      end

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
