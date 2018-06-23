require 'spec_helper'

require File.expand_path('../../../lib/command/report', __dir__)

describe Command::Report do
  let(:robot) { double('robot', 'row' => 2, 'column' => 2, 'direction' => 'NORTH', 'on_table?' => true) }
  let(:output) { double('output') }
  let(:formatter) { double('formatter', message: '2,2,NORTH') }
  subject { described_class.new(robot: robot, output: output) }

  describe '#execute' do
    it 'should put 2,2,NORTH to output' do
      allow(subject).to receive(:formatter).and_return(formatter)
      expect(output).to receive(:puts).with('2,2,NORTH')
      subject.execute
    end
  end
end
