# frozen_string_literal: true

require_relative '../../rspec_helper'

describe ::Coppier do
  before do
    stub_const('Coppier::LANGUAGE', :lan)
    allow_any_instance_of(described_class).to receive(:object) { object }
  end

  let(:object) do
    {
      lan: {
        foo: { hello: 'Hello world' },
        bar: { fizz: 'Buzz Lightyear' }
      }
    }
  end

  context '.get' do
    context 'when key path is valid' do
      subject { described_class.get(:foo, :hello) }

      it { is_expected.to eq('Hello world') }
    end

    context 'when key path is not valid' do
      subject { described_class.get(:foo, 'hello') }

      it 'raises CopyNotFound error' do
        expect { subject }.to raise_error(CopyNotFound, 'Copy "foo > hello" not found')
      end
    end
  end
end
