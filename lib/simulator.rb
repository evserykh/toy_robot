class Simulator
  attr_reader :robot, :table, :greeting, :command_resolver

  def initialize(options)
    @robot = options.fetch(:robot)
    @table = options.fetch(:table)
    @greeting = options.fetch(:greeting)
    @command_resolver = options.fetch(:command_resolver)
  end

  def run
    handle_ctrl_c
    print_greeting

    while (cmd = gets&.chomp)
      command_resolver.resolve(cmd)&.execute
    end
  end

  private

  def print_greeting
    puts greeting
  end

  def handle_ctrl_c
    trap('SIGINT') do
      puts
      exit
    end
  end
end
