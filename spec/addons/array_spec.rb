# frozen_string_literal: true

require_relative '../rspec_helper'

describe Array do
  let(:arr) { %i[a b c d] }

  context '#except' do
    context 'when not empty arr' do
      let(:expected_arr) { %i[a b d] }

      subject { arr.except(:c) }

      it { is_expected.to eq(expected_arr) }
    end

    context 'when empty arr' do
      let(:arr) { [] }

      it { is_expected.to eq(arr) }
    end

    context 'when item not found' do
      subject { arr.except('foo') }

      it { is_expected.to eq(arr) }
    end
  end

  context '#not_empty' do
    subject { arr.not_empty? }

    context 'when not empty array' do
      it { is_expected.to be_truthy }
    end

    context 'when not empty array' do
      let(:arr) { [] }
      it { is_expected.to be_falsy }
    end
  end

  context '#only' do
    context 'when not empty arr' do
      let(:expected_arr) { %i[c] }

      subject { arr.only(:c) }

      it { is_expected.to eq(expected_arr) }
    end

    context 'when empty arr' do
      let(:arr) { [] }

      it { is_expected.to eq(arr) }
    end

    context 'when item not found' do
      subject { arr.only('foo') }

      it { is_expected.to eq([]) }
    end
  end
end
