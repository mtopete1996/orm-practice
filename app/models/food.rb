# frozen_string_literal: true

module Models
  class Food < Base
    attr_accessor :id, :name

    COLLECTION_NAME = 'foods'

    def initialize(name, id = nil)
      super(id)
      @name = name
    end
  end
end
