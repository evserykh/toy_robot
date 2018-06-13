require 'spec_helper'

require File.expand_path('../../../../lib/command/matcher/left', __dir__)

describe Command::Matcher::Left do
  describe '#match?' do
    context 'when the command equals LEFT' do
      subject { described_class.new(command: 'LEFT') }
      it { expect(subject.match?).to eq true }
    end

    context 'when the command equals LET' do
      subject { described_class.new(command: 'LET') }
      it { expect(subject.match?).to eq false }
    end
  end
end
