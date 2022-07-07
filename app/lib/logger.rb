# frozen_string_literal: true

class Logger
  CONFIRMATION_MESSAGE = 'Are you sure? Y/n'

  class << self
    def confirmation(message = CONFIRMATION_MESSAGE)
      resp = input(message).downcase
      return if resp == 'n'
      return true if resp == 'y'

      copy(:logger, :invalid_option)
    end

    def copy(*copy_path)
      self.print(::Coppier.get(*copy_path))
    end

    def input(message)
      print(message)
      gets(chomp: true)
    end

    def print(text)
      puts(text)
    end

    def print_hash(hsh)
      hsh.each do |key, val|
        self.print("#{key} : #{val}")
      end
    end

    def separator(repetitions: 30, char: '-')
      str = ''
      repetitions.times do
        str += char
      end
      self.print(str)
    end
  end
end
