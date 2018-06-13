require 'spec_helper'

require File.expand_path('../../../../lib/command/matcher/report', __dir__)

describe Command::Matcher::Report do
  describe '#match?' do
    context 'when the command equals REPORT' do
      subject { described_class.new(command: 'REPORT') }
      it { expect(subject.match?).to eq true }
    end

    context 'when the command equals PORT' do
      subject { described_class.new(command: 'PORT') }
      it { expect(subject.match?).to eq false }
    end
  end
end
