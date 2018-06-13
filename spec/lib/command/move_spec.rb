require 'spec_helper'

require File.expand_path('../../../lib/command/move', __dir__)
require File.expand_path('../../../lib/direction', __dir__)
require File.expand_path('../../../lib/toy_robot', __dir__)

describe Command::Move do
  describe '#execute' do
    let(:table) { double('table') }
    let(:robot) { ToyRobot.new }
    subject { described_class.new(robot: robot) }

    context 'when the robot is on the table' do
      before do
        allow(table).to receive(:include?).and_return(true)
        robot.table = table
        robot.direction = Direction.parse('NORTH')
        robot.row = 2
        robot.column = 2
      end

      it 'should set new row and column values' do
        expect(robot).to receive(:row=)
        expect(robot).to receive(:column=)
        subject.execute
      end
    end

    context 'when the robot is not on a table' do
      before { subject.execute }

      it { expect(robot).not_to receive(:row=) }
      it { expect(robot).not_to receive(:column=) }
    end

    context 'when after movement the robot stays on the table' do
      before do
        allow(table).to receive(:include?).and_return(true)
        robot.table = table
        robot.direction = Direction.parse('NORTH')
        robot.row = 2
        robot.column = 2
        subject.execute
      end

      it { expect(robot.row).to eq 2 }
      it { expect(robot.column).to eq 3 }
    end

    context 'when after movement the robot leaves the table' do
      before do
        allow(table).to receive(:include?).and_return(false)
        robot.table = table
        robot.direction = Direction.parse('NORTH')
        robot.row = 2
        robot.column = 2
      end

      it 'should not set new row and column values' do
        expect(robot).not_to receive(:row=)
        expect(robot).not_to receive(:column=)
        subject.execute
      end
    end
  end
end
