# frozen_string_literal: true

require_relative '../../rspec_helper'

describe Collection do
  context 'when initialized' do
    before do
      allow(SchemasReader).to receive(:collection_names).and_return(models)
    end

    let(:models) { %i[things stuff] }

    subject { described_class.instance }

    it 'create the collections' do
      expect(subject.instance_variables.include?(:"@#{models[0]}")).to be_truthy
      expect(subject.instance_variables.include?(:"@#{models[1]}")).to be_truthy
    end

    it 'define the getters' do
      expect(subject.methods.include?(models[0])).to be_truthy
      expect(subject.methods.include?(models[1])).to be_truthy
    end
  end
end
