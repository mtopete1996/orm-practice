# frozen_string_literal: true

module Models
  class Base
    class << self
      def create(name)
        Collection.instance.send(self::MODEL_NAME) << new(name)
      end
    end
  end
end
