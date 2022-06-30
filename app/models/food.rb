# frozen_string_literal: true

require 'debug'

require_relative './base'

module Models
  class Food < Base
    attr_reader :name

    MODEL_NAME = 'foods'

    def initialize(name)
      @name = name
    end
  end
end
