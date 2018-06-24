require File.expand_path('../formatter', __dir__)
require File.expand_path('base', __dir__)

module Command
  class Report < Base
    attr_reader :output, :format, :formatter_class

    def initialize(options)
      super
      @output = options.fetch(:output, $stdout)
      @format = options[:format]
      @formatter_class = options.fetch(:formatter_class, Formatter)
    end

    private

    def action
      output.puts formatter.message
    end

    def formatter
      formatter_class.new(robot: robot, format: format)
    end
  end
end
