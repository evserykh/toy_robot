require 'spec_helper'

require File.expand_path('../../../lib/command/resolver', __dir__)

class Matcher;
  def initialize(command:)
    @command = command
  end

  def match?
    @command == 'CMD'
  end

  def options
    {}
  end
end

class Jump; end

describe Command::Resolver do
  let(:robot) { double('robot') }
  let(:table) { double('table') }
  subject { described_class.new(robot: robot, table: table) }

  before do
    subject.commands << { Matcher => Jump }
  end

  describe '#resolve' do
    context 'when the command matches' do
      it { expect(subject.resolve('CMD')).to be_a Jump }
    end

    context 'when the command does not match' do
      it { expect(subject.resolve('COMMAND')).to be nil }
    end
  end
end
