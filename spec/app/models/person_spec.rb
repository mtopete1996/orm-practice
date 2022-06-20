# frozen_string_literal: true

require 'rspec'
require 'debug'

require_relative '../../../app/models/person'
require_relative '../../../app/lib/collection'

describe ::Models::Person do
  before(:each) do
    Collection.instance.instance_variable_set('@persons', [person])
    allow(Collection.instance).to receive(:persons) do
      Collection.instance.instance_variable_get('@persons')
    end
  end

  let(:person) { described_class.new('Manuel') }

  context '.create' do
    let(:name) { 'Eduardo' }

    context 'when name provided' do
      subject { described_class.create(name) }

      it 'adds person to the collection' do
        subject
        expect(Collection.instance.persons.length).to eq(2)
        expect(Collection.instance.persons[1].id).to eq(2)
        expect(Collection.instance.persons[1].name).to eq(name)
      end
    end

    context 'when id provided' do
      subject { described_class.create(name, 99) }

      it 'adds person to the collection and leaves provided ID' do
        subject
        expect(Collection.instance.persons.length).to eq(2)
        expect(Collection.instance.persons[1].id).to eq(99)
        expect(Collection.instance.persons[1].name).to eq(name)
      end
    end
  end

  context '.all' do
    subject { described_class.all }

    context 'when name provided' do
      it 'adds person to the collection' do
        subject
        expect(Collection.instance.persons.length).to eq(1)
        expect(Collection.instance.persons[0].id).to eq(person.id)
        expect(Collection.instance.persons[0].name).to eq(person.name)
      end
    end
  end
end
