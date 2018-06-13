require 'spec_helper'

require File.expand_path('../../../../lib/command/matcher/right', __dir__)

describe Command::Matcher::Right do
  describe '#match?' do
    context 'when the command equals RIGHT' do
      subject { described_class.new(command: 'RIGHT') }
      it { expect(subject.match?).to eq true }
    end

    context 'when the command equals TIGHT' do
      subject { described_class.new(command: 'TIGHT') }
      it { expect(subject.match?).to eq false }
    end
  end
end
