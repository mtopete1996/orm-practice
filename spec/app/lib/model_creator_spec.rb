# frozen_string_literal: true

require_relative '../../rspec_helper'

describe ModelCreator do
  let(:creator) { described_class.new(model) }
  let(:model) { ::Models::Food }
  let(:model_attributes) { model.attributes }

  context '#call' do
    subject { creator.call }

    context 'when valid model' do
      before do
        allow(::Logger).to receive(:input).with(:name).and_return('Manuel')
        allow(::Logger).to receive(:input).with(:description).and_return('Ruby Dev')
        allow(::Logger).to receive(:confirmation).and_return('y')
      end

      let(:expected_params) { { name: 'Manuel', description: 'Ruby Dev' } }
      let(:create_params) { 'Manuel' }

      it 'works!' do
        expect(::Logger).to receive(:separator).once
        expect(::Logger).to receive(:copy).with(:model_creator, :params_showing)
        expect(::Logger).to receive(:print_hash).with(expected_params)
        expect(model).to receive(:create).with(create_params)
        subject
        expect(creator.parameters).to eq(expected_params)
      end
    end
  end
end
