require File.expand_path('command', __dir__)

class Simulator
  attr_reader :robot, :table, :greeting, :command_resolver, :output

  def initialize(options)
    @robot = options.fetch(:robot)
    @table = options.fetch(:table)
    @greeting = options.fetch(:greeting)
    @command_resolver = options.fetch(:command_resolver)
    @output = options.fetch(:output, $stdout)
  end

  def run
    handle_ctrl_c
    print_greeting

    while (cmd = gets&.chomp)
      begin
        command_resolver.resolve(cmd)&.execute
      rescue Command::RobotNotOnTableError => exception
        output.puts exception.message
      end
    end
  end

  private

  def print_greeting
    output.puts greeting
  end

  def handle_ctrl_c
    trap('SIGINT') do
      puts
      exit
    end
  end
end
