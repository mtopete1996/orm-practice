# frozen_string_literal: true

module Models
  class Person < Base
    attr_reader :name

    MODEL_NAME = 'persons'

    def initialize(name)
      @name = name
    end
  end
end
