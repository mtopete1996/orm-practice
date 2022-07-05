# frozen_string_literal: true

require_relative '../../../rspec_helper'

describe ::Menu::Main do
  context '.generate' do
    let(:options) { ['1. foods', '2. persons'] }
    subject { described_class.generate }

    it 'dynamically generates the menu with existing models' do
      expect(::Logger).to receive(:print).with(options).once
      expect(::Logger).to receive(:input).with('Ingresa una opcion: ').once
      expect(::Logger).to receive(:separator).once
      subject
    end
  end
end
