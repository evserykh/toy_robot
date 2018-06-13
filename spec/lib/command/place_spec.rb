require 'spec_helper'

require File.expand_path('../../../lib/command/place', __dir__)
require File.expand_path('../../../lib/toy_robot', __dir__)

describe Command::Place do
  let(:table) { double('table') }
  let(:robot) { ToyRobot.new }
  subject { described_class.new(robot: robot, table: table, row: 2, column: 2, direction: 'north') }

  describe '#execute' do
    context 'when the table include the cell' do
      before { allow(table).to receive(:include?).and_return(true) }
      before { subject.execute }

      it { expect(robot.table).to eq table }
      it { expect(robot.row).to eq 2 }
      it { expect(robot.column).to eq 2 }
      it { expect(robot.direction).to eq 'north' }
    end

    context 'when the table does not include the cell' do
      before { allow(table).to receive(:include?).and_return(false) }
      before { subject.execute }

      it { expect(robot.table).to eq nil }
      it { expect(robot.row).to eq nil }
      it { expect(robot.column).to eq nil }
      it { expect(robot.direction).to eq nil }
    end
  end
end
