# frozen_string_literal: true

unless defined?(::Models::Base)
  require 'rspec'

  load './app/app.rb'
end

describe ::App do
  let(:app) { described_class.new }

  describe '#call' do
    context 'when option exists' do
      before do
        allow(app).to receive(:read_option) { 1 }
        allow(app).to receive(:select_model) { ::Models::Food }
        allow(app).to receive(:model) { ::Models::Food }
      end

      let(:selected_option) { 1 }
      let(:expected_message) { "You've selected foods" }

      subject { app.call }

      it 'initializes the app' do
        expect(::Logger).to receive(:print).with(expected_message)
        subject
      end
    end

    context 'when option does not exist' do
      before do
        allow(app).to receive(:read_option) { 99 }
        allow(app).to receive(:select_model) { nil }
        allow(app).to receive(:model) { nil }
      end

      let(:selected_option) { 99 }
      let(:expected_message) { 'Selected model does not exist' }

      subject { app.call }

      it 'initializes the app' do
        expect(::Logger).to receive(:print).with(expected_message)
        subject
      end
    end
  end
end
