# frozen_string_literal: true

module Menu
  class Main < Base
    class << self
      def generate
        ::Logger.print(options)
        ::Logger.input(::Coppier.get(:menu, :main, :default_input_copy)).tap do
          ::Logger.separator
        end
      end

      private

      def options
        ::SchemasReader.collection_names.map.with_index do |model, index|
          "#{index + 1}. #{model}"
        end
      end
    end
  end
end
