require 'spec_helper'

require File.expand_path('../../../../lib/command/matcher/move', __dir__)

describe Command::Matcher::Move do
  describe '#match?' do
    context 'when the command equals MOVE' do
      subject { described_class.new(command: 'MOVE') }
      it { expect(subject.match?).to eq true }
    end

    context 'when the command equals MORE' do
      subject { described_class.new(command: 'MORE') }
      it { expect(subject.match?).to eq false }
    end
  end
end
