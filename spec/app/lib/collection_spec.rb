# frozen_string_literal: true

require_relative '../../rspec_helper'

describe Collection do
  context 'dynamic_getters' do
    before do
      allow(SchemasReader).to receive(:collection_names).and_return(models)
    end

    let(:models) { %i[things stuff] }

    subject { described_class.instance }

    it 'instances the collections' do
      expect(subject.instance_variables.include?(:"@#{models[0]}")).to be_truthy
      expect(subject.instance_variables.include?(:"@#{models[1]}")).to be_truthy
    end

    it 'generates the methods' do
      expect(subject.methods.include?(models[0])).to be_truthy
      expect(subject.methods.include?(models[1])).to be_truthy
    end
  end
end
