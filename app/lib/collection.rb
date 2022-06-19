# frozen_string_literal: true

require 'singleton'

require_relative './schemas_reader'

class Collection
  include Singleton

  def initialize
    create_collections
    define_getters
  end

  private

  def create_collections
    SchemasReader.collection_names.each do |model|
      instance_variable_set("@#{model}", [])
    end
  end

  def define_getters
    SchemasReader.collection_names.each do |model|
      self.class.send(:define_method, model) { instance_variable_get("@#{model}") }
    end
  end
end
