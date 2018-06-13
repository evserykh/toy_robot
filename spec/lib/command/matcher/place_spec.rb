require 'spec_helper'

require File.expand_path('../../../../lib/command/matcher/place', __dir__)

describe Command::Matcher::Place do
  describe '#match?' do
    context 'when the command equals PLACE 1,1,WEST' do
      subject { described_class.new(command: 'PLACE 1,1,WEST', directions: %w[WEST EAST]) }
      it { expect(subject.match?).to eq true }
    end

    context 'when the command equals PACE 1,1,EAST' do
      subject { described_class.new(command: 'PACE 1,1,EAST', directions: %w[WEST EAST]) }
      it { expect(subject.match?).to eq false }
    end

    context 'when such direction does not exist' do
      subject { described_class.new(command: 'PLACE 1,1,EAST', directions: %w[NOTRH WEST]) }
      it { expect(subject.match?).to eq false }
    end
  end
end
