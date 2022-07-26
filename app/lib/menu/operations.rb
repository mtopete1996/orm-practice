# frozen_string_literal: true

require 'psych'

module Menu
  class Operations < Base
    OPTIONS = ['Create', 'Read All'].freeze

    class << self
      private

      def options
        OPTIONS.map.with_index do |opt, index|
          "#{index + 1}. #{opt}"
        end
      end
    end
  end
end
