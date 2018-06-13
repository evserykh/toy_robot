require File.expand_path('base', __dir__)

module Command
  class Report
    attr_reader :output

    include Base

    def initialize(options)
      super
      @output = options.fetch(:output, $stdout)
    end

    private

    def action
      output.puts "#{robot.row},#{robot.column},#{robot.direction}"
    end
  end
end
