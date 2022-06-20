# frozen_string_literal: true

require_relative '../lib/collection'
require_relative '../lib/idable'

module Models
  class Base
    include ::Idable

    attr_reader :id

    def initialize(id)
      @id = id || calculate_id
    end

    class << self
      def create(name, id = nil)
        Collection.instance.send(self::MODEL_NAME) << new(name, id)
      end

      def all
        Collection.instance.send(self::MODEL_NAME)
      end
    end
  end
end
