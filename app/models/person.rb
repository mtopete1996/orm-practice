# frozen_string_literal: true

require 'debug'

require_relative './base'

module Models
  class Person < Base
    attr_reader :name

    MODEL_NAME = 'persons'

    def initialize(name)
      @name = name
    end
  end
end
