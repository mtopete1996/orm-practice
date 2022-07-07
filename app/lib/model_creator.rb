# frozen_string_literal: true

class ModelCreator
  attr_reader :model, :parameters, :only, :exclude

  def initialize(model, only: [], exclude: [])
    @model = model
    @parameters = {}
    @only = only
    @exclude = exclude
  end

  class << self
    def call(model, only: [], exclude: [])
      new(model, only:, exclude:).call
    end
  end

  def call
    raise(ArgumentError, Coppier.get(:model_creator, :only_or_exclude)) if only_and_exclude_present

    read_parameters
    ::Logger.separator
    ::Logger.copy(:model_creator, :params_showing)
    ::Logger.print_hash(parameters)
    return ::Logger.copy(:wont_save) unless ::Logger.confirmation

    create_instance
  end

  private

  def attributes_to_read
    attrs = model.attributes
    return attrs unless only_and_exclude_present
    return attrs.except(*exclude) if exclude.not_empty?
    return attrs.slice(*only) if only.not_empty?
  end

  def create_instance
    model.create(parameters[:name])
  end

  def only_and_exclude_present
    only.not_empty? && exclude.not_empty?
  end

  def read_parameters
    attributes_to_read.each do |attribute|
      parameters[attribute] = ::Logger.input(attribute)
    end
  end
end
