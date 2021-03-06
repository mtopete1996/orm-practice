# frozen_string_literal: true

module Models
  class Person < Base
    attr_reader :id, :name

    COLLECTION_NAME = 'persons'

    def initialize(name, id = nil)
      super(id)
      @name = name
    end
  end
end
