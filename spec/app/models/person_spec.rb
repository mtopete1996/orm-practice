# frozen_string_literal: true

require 'rspec'
require 'debug'

require_relative '../../../app/models/person'
require_relative '../../../app/lib/collection'

describe ::Models::Person do
  context '.create' do
    before do
      Collection.instance.instance_variable_set('@persons', [])
      allow(Collection.instance).to receive(:persons) do
        Collection.instance.instance_variable_get('@persons')
      end
    end

    let(:name) { 'Manuel' }

    subject { described_class.create(name) }

    context 'when name provided' do
      it 'adds person to the collection' do
        subject
        expect(Collection.instance.persons[0].name).to eq(name)
      end
    end
  end
end
