require 'spec_helper'

require File.expand_path('../../lib/toy_robot', __dir__)

describe ToyRobot do
  describe '#on_table?' do
    subject { described_class.new }

    context 'when it is on the table' do
      before { subject.table = double('table') }
      it { expect(subject).to be_on_table }
    end

    context 'when it is not on a table' do
      it { expect(subject).not_to be_on_table }
    end
  end
end
