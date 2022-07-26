# frozen_string_literal: true

module Menu
  class Base
    class << self
      def generate
        ::Logger.print(options)
        ::Logger.input(::Coppier.get(:menu, :default_input_copy)).to_i.tap do
          ::Logger.separator
        end
      end
    end
  end
end
