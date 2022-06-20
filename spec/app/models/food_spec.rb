# frozen_string_literal: true

require 'rspec'
require 'debug'

require_relative '../../../app/models/food'
require_relative '../../../app/lib/collection'

describe ::Models::Food do
  before(:each) do
    Collection.instance.instance_variable_set('@foods', [food])
    allow(Collection.instance).to receive(:foods) do
      Collection.instance.instance_variable_get('@foods')
    end
  end

  let(:food) { described_class.new('Burrito') }

  context '.create' do
    let(:name) { 'Pizza' }

    context 'when name provided' do
      subject { described_class.create(name) }

      it 'adds food to the collection' do
        subject
        expect(Collection.instance.foods.length).to eq(2)
        expect(Collection.instance.foods[1].id).to eq(2)
        expect(Collection.instance.foods[1].name).to eq(name)
      end
    end

    context 'when id provided' do
      subject { described_class.create(name, 99) }

      it 'adds food to the collection and leaves provided ID' do
        subject
        expect(Collection.instance.foods.length).to eq(2)
        expect(Collection.instance.foods[1].id).to eq(99)
        expect(Collection.instance.foods[1].name).to eq(name)
      end
    end
  end

  context '.all' do
    subject { described_class.all }

    context 'when name provided' do
      it 'adds food to the collection' do
        subject
        expect(Collection.instance.foods.length).to eq(1)
        expect(Collection.instance.foods[0].id).to eq(food.id)
        expect(Collection.instance.foods[0].name).to eq(food.name)
      end
    end
  end
end
