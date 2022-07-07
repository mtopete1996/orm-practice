# frozen_string_literal: true

module Menu
  class Main < Base
    class << self
      private

      def options
        ::SchemasReader.collection_names.map.with_index do |model, index|
          "#{index + 1}. #{model}"
        end
      end
    end
  end
end
