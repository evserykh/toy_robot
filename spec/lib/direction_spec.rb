require 'spec_helper'

require File.expand_path('../../lib/direction', __dir__)

describe Direction do
  describe '.parse' do
    context 'when such direction exists' do
      subject { described_class.parse('NORTH') }
      it { expect(subject).to be_a described_class }
    end

    context 'when such direction does not exist' do
      subject { described_class.parse('FORWARD') }
      it { expect(subject).to eq nil }
    end
  end

  described_class::VALUES.each do |value|
    describe "##{value.downcase}?" do
      subject { described_class.parse(value) }
      it { expect(subject.public_send("#{value.downcase}?")).to eq true }
    end
  end

  describe '#left' do
    let(:direction) { described_class.parse('NORTH') }
    subject { direction.left }
    it { expect(subject).to be_a described_class }
    it { expect(subject).not_to eq direction }
    it { expect(subject).to be_west }
  end

  describe '#right' do
    let(:direction) { described_class.parse('NORTH') }
    subject { direction.right }
    it { expect(subject).to be_a described_class }
    it { expect(subject).not_to eq direction }
    it { expect(subject).to be_east }
  end

  describe '#to_s' do
    subject { described_class.parse('NORTH') }
    it { expect(subject.to_s).to eq 'NORTH' }
  end
end
