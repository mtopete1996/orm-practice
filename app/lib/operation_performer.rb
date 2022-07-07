# frozen_string_literal: true

class OperationPerformer
  attr_reader :model, :operation

  EXCLUDED_FOR_NOW = %i[description].freeze

  def initialize(model:, operation:)
    @model = model
    @operation = operation
  end

  class << self
    def call(model:, operation:)
      new(model:, operation:).call
    end
  end

  def call
    case operation
    when 1
      ::ModelCreator.call(model, exclude: EXCLUDED_FOR_NOW)
    when 2
      return Logger.copy(:app, :empty_collection) if model_all.empty?

      Logger.print(model_all.map(&:name))
    end
  end

  private

  def model_all
    @model_all ||= model.all
  end
end
