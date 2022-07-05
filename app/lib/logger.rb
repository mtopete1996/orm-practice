# frozen_string_literal: true

class Logger
  class << self
    def input(message)
      print message
      gets(chomp: true)
    end

    def print(text)
      puts text
    end

    def separator(repetitions: 30, char: '-')
      str = ''
      repetitions.times do
        str += char
      end
      puts str
    end
  end
end
