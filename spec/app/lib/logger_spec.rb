require_relative '../../rspec_helper'

describe ::Logger do
  context '.input' do
    let(:message) { "Input message\n" }
    subject { described_class.input(message) }

    it 'prints message and reads a variable' do
      expect_any_instance_of(Kernel).to receive(:gets)
      expect { subject }.to output(message).to_stdout
    end
  end

  context '.print' do
    let(:message) { "Output message\n" }
    subject { described_class.print(message) }

    it 'prints message and reads a variable' do
      expect { subject }.to output(message).to_stdout
    end
  end

  context '.separator' do
    context 'when no params' do
      let(:expected_string) { "------------------------------\n" }
      subject { described_class.separator }

      it 'prints the default separator' do
        expect { subject }.to output(expected_string).to_stdout
      end
    end

    context 'when char param is sent' do
      let(:expected_string) { "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n" }
      let(:char_param) { '&' }
      subject { described_class.separator(char: char_param) }

      it 'prints the default separator' do
        expect { subject }.to output(expected_string).to_stdout
      end
    end

    context 'when repetitions param is sent' do
      let(:expected_string) { "---\n" }
      let(:repetitions_param) { 3 }
      subject { described_class.separator(repetitions: repetitions_param) }

      it 'prints the default separator' do
        expect { subject }.to output(expected_string).to_stdout
      end
    end
  end
end
