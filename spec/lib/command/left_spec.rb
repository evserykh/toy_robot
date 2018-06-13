require 'spec_helper'

require File.expand_path('../../../lib/command/left', __dir__)
require File.expand_path('../../../lib/direction', __dir__)
require File.expand_path('../../../lib/toy_robot', __dir__)

describe Command::Left do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(robot: robot) }

  describe '#execute' do
    before { robot.direction = Direction.parse('NORTH') }
    before { allow(robot).to receive(:on_table?).and_return(true) }
    before { subject.execute }

    it { expect(robot.direction).to be_west }
  end
end
