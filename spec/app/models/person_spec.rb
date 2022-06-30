# frozen_string_literal: true

require_relative '../../rspec_helper'

describe ::Models::Person do
  before do
    Collection.instance.instance_variable_set('@persons', [])
    allow(Collection.instance).to receive(:persons) do
      Collection.instance.instance_variable_get('@persons')
    end
  end

  context '.create' do
    let(:name) { 'Sofi' }

    context 'when name provided' do
      subject { described_class.create(name) }

      it 'adds person to the collection' do
        subject
        expect(Collection.instance.persons[0].id).to eq(1)
        expect(Collection.instance.persons[0].name).to eq(name)
      end
    end

    context 'when name provided' do
      let(:id) { 99 }

      subject { described_class.create(name, 99) }

      it 'adds person to the collection' do
        subject
        expect(Collection.instance.persons[0].id).to eq(99)
        expect(Collection.instance.persons[0].name).to eq(name)
      end
    end
  end

  context '.all' do
    before do
      Collection.instance.persons << person
    end

    let(:person) { described_class.new('Bety') }

    subject { described_class.all }

    it 'returns all persons' do
      expect(subject[0].id).to eq(1)
      expect(subject[0].name).to eq(person.name)
    end
  end
end
