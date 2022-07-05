# frozen_string_literal: true

module Models
  class Base
    include Models::Behaviors::Idable

    def initialize(id)
      @id = id || calculate_id
    end

    class << self
      def create(name, id = nil)
        Collection.instance.send(self::COLLECTION_NAME) << new(name, id)
      end

      def all
        Collection.instance.send(self::COLLECTION_NAME)
      end
    end
  end
end
