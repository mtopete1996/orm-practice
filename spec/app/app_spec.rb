# frozen_string_literal: true

load './app/app.rb'

describe ::App do
  let(:app) { described_class.new }

  describe '#call' do
    context 'when option exists' do
      before do
        # Select the model
        allow(app).to receive(:read_model_option) { 1 }
        allow(app).to receive(:find_model) { model }
        allow(app).to receive(:model) { model }

        # Select the operation
        allow(app).to receive(:select_operation) { 1 }
      end

      let(:model) { 1 }
      let(:model) { ::Models::Food }
      let(:expected_message) { ['1. foods', '2. persons'] }

      subject { app.call }

      it 'initializes the app' do
        expect(::OperationPerformer).to receive(:call).with(model:, operation: 1)
        subject
      end
    end

    context 'when option does not exist' do
      before do
        # Select the model
        allow(app).to receive(:read_model_option) { 99 }
        # allow(app).to receive(:find_model) { model }
        # allow(app).to receive(:model) { model }
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
