require 'spec_helper'

require File.expand_path('../../../lib/command', __dir__)
require File.expand_path('../../../lib/command/base', __dir__)

class Jump < Command::Base
end

describe Command::Base do
  let(:robot) { double('robot') }
  subject { Jump.new(robot: robot) }

  describe '#execute' do
    context 'when the robot in on the table' do
      before { allow(robot).to receive(:on_table?).and_return(true) }

      it 'should invoke action method' do
        expect(subject).to receive(:action)
        subject.execute
      end
    end

    context 'when the robot is not on a table' do
      before { allow(robot).to receive(:on_table?).and_return(false) }

      it 'should raise an exception' do
        expect { subject.execute }.to raise_error Command::RobotNotOnTableError
        expect(subject).not_to receive(:action)
      end
    end

    context 'when the method action is not implemented' do
      before { allow(robot).to receive(:on_table?).and_return(true) }
      it { expect { subject.execute }.to raise_error NotImplementedError }
    end
  end
end
