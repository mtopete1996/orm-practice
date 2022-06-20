# frozen_string_literal: true

require 'rspec'
require 'debug'

require_relative '../../../app/models/food'
require_relative '../../../app/lib/collection'

describe ::Models::Food do
  context '.create' do
    before do
      Collection.instance.instance_variable_set('@foods', [])
      allow(Collection.instance).to receive(:foods) do
        Collection.instance.instance_variable_get('@foods')
      end
    end

    let(:name) { 'Manuel' }

    subject { described_class.create(name) }

    context 'when name provided' do
      it 'adds food to the collection' do
        subject
        expect(Collection.instance.foods[0].name).to eq(name)
      end
    end
  end
end
