# frozen_string_literal: true

require_relative '../../rspec_helper'

describe ::Logger do
  context '.confirmation' do
    context 'when no message sent' do
      let(:default_message) { described_class::CONFIRMATION_MESSAGE }
      subject { described_class.confirmation }

      context 'when resp is y' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(default_message).and_return('y')
          expect(subject).to be_truthy
        end
      end

      context 'when resp is n' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(default_message).and_return('n')
          expect(subject).to be_falsey
        end
      end

      context 'when resp is other' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(default_message).and_return('invalid')
          expect(described_class).to receive(:copy).with(:logger, :invalid_option)
          expect(subject).to be_falsey
        end
      end
    end

    context 'when message sent' do
      let(:message_param) { 'A ver confirma?' }
      subject { described_class.confirmation(message_param) }

      context 'when resp is y' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(message_param).and_return('y')
          expect(subject).to be_truthy
        end
      end

      context 'when resp is n' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(message_param).and_return('n')
          expect(subject).to be_falsey
        end
      end

      context 'when resp is other' do
        it 'prints default message and returns true' do
          expect(described_class).to receive(:input).with(message_param).and_return('invalid')
          expect(described_class).to receive(:copy).with(:logger, :invalid_option)
          expect(subject).to be_falsey
        end
      end
    end
  end

  context '.copy' do
    subject { described_class.copy(:dummy, :path) }

    it 'calls Coppier and prints it' do
      expect(::Coppier).to receive(:get).once
      expect(described_class).to receive(:print).once
      subject
    end
  end

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

  context '.print_hash' do
    subject { described_class.print_hash(hsh) }

    context 'when hash not empty' do
      let(:hsh) { { name: 'Manuel', description: 'Ruby Dev' } }

      it 'prints the hash' do
        expect(described_class).to receive(:print).with('name : Manuel').once
        expect(described_class).to receive(:print).with('description : Ruby Dev').once
        subject
      end
    end

    context 'when hash is empty' do
      let(:hsh) { {} }

      it 'wont print anything' do
        expect(described_class).to receive(:print).never
        subject
      end
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
