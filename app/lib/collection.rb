# frozen_string_literal: true

require 'singleton'

require_relative './schemas_reader'

class Collection
  include Singleton

  # Define getters for collections
  binding.break
  SchemasReader.collection_names.each do |model|
    define_method(model) { instance_variable_get("@#{model}") }
  end

  def initialize
    create_collections
  end

  private

  def create_collections
    SchemasReader.collection_names.each do |model|
      instance_variable_set("@#{model}", [])
    end
  end
end
