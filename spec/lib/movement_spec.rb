require 'spec_helper'

require File.expand_path('../../lib/direction', __dir__)
require File.expand_path('../../lib/movement', __dir__)

describe Movement do
  describe '#execute' do
    subject { described_class.new(row: 2, column: 2, direction: direction) }
    before { subject.execute }

    context 'when north direction' do
      let(:direction) { Direction.parse('NORTH') }
      it { expect(subject.row).to eq 2 }
      it { expect(subject.column).to eq 3 }
    end

    context 'when east direction' do
      let(:direction) { Direction.parse('EAST') }
      it { expect(subject.row).to eq 3 }
      it { expect(subject.column).to eq 2 }
    end

    context 'when south direction' do
      let(:direction) { Direction.parse('SOUTH') }
      it { expect(subject.row).to eq 2 }
      it { expect(subject.column).to eq 1 }
    end

    context 'when west direction' do
      let(:direction) { Direction.parse('WEST') }
      it { expect(subject.row).to eq 1 }
      it { expect(subject.column).to eq 2 }
    end
  end
end
