# frozen_string_literal: true

require_relative '../../rspec_helper'

describe ::Models::Food do
  before do
    Collection.instance.instance_variable_set('@foods', [])
    allow(Collection.instance).to receive(:foods) do
      Collection.instance.instance_variable_get('@foods')
    end
  end

  context '.create' do
    let(:name) { 'Burrito' }

    context 'when name provided' do
      subject { described_class.create(name) }

      it 'adds food to the collection' do
        subject
        expect(Collection.instance.foods[0].id).to eq(1)
        expect(Collection.instance.foods[0].name).to eq(name)
      end
    end

    context 'when name provided' do
      let(:id) { 99 }

      subject { described_class.create(name, 99) }

      it 'adds food to the collection' do
        subject
        expect(Collection.instance.foods[0].id).to eq(99)
        expect(Collection.instance.foods[0].name).to eq(name)
      end
    end
  end

  context '.all' do
    before do
      Collection.instance.foods << food
    end

    let(:food) { described_class.new('Pizza') }

    subject { described_class.all }

    it 'returns all foods' do
      expect(subject[0].id).to eq(1)
      expect(subject[0].name).to eq(food.name)
    end
  end
end
