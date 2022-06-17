# frozen_string_literal: true

require 'rspec'
require 'debug'

require_relative '../../../app/models/person'
require_relative '../../../app/lib/collection'

describe ::Models::Person do
  context '.create' do
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
