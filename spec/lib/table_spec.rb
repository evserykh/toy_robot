require 'spec_helper'

require File.expand_path('../../lib/table', __dir__)

describe Table do
  describe '#include?' do
    subject { described_class.new(rows: 5, columns: 5) }

    context 'when cell belongs to the table' do
      it { expect(subject.include?(2, 2)).to eq true }
    end

    context 'when cell does not belong to the table' do
      it { expect(subject.include?(2, 5)).to eq false }
    end
  end
end
