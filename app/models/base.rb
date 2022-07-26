# frozen_string_literal: true

module Models
  class Base
    include Models::Behaviors::Idable

    def initialize(id)
      @id = id || calculate_id
    end

    class << self
      def all
        Collection.instance.send(self::COLLECTION_NAME)
      end

      def attributes
        SchemasReader.collection_attributes(model_name)
      end

      def create(name, id = nil)
        Collection.instance.send(self::COLLECTION_NAME) << new(name, id)
      end

      def model_name
        name.split('::').last.downcase.to_sym
      end
    end
  end
end
