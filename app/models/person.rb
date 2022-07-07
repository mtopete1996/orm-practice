# frozen_string_literal: true

module Models
  class Person < Base
    attr_accessor :id, :name

    COLLECTION_NAME = 'persons'

    def initialize(name, id = nil)
      super(id)
      @name = name
    end
  end
end
