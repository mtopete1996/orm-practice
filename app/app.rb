# frozen_string_literal: true

load './autoloader.rb' unless defined?(::Models::Base)

class App
  attr_reader :model, :option

  class << self
    def call
      new.call
    end
  end

  def call
    return ::Logger.copy(:app, :not_existing_model) if valid_option?

    ::OperationPerformer.call(model:, operation: select_operation)
  end

  private

  def find_model
    @model = ::Models::Base.subclasses.find { |mdl| mdl::COLLECTION_NAME == option }
  end

  def read_model_option
    @option = ::SchemasReader.collection_names[::Menu::Main.generate - 1]
  end

  def select_operation
    ::Menu::Operations.generate
  end

  def valid_option?
    read_model_option.nil? || find_model.nil?
  end
end
