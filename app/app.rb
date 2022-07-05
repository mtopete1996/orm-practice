# frozen_string_literal: true

load './autoloader.rb'

class App
  attr_reader :model, :option

  class << self
    def call
      new.call
    end
  end

  def call
    return ::Logger.print(::Coppier.get(:app, :not_existing_model)) if read_option.nil? || select_model.nil?

    ::Logger.print("You've selected #{model::COLLECTION_NAME}")
  end

  private

  def read_option
    @option = ::SchemasReader.collection_names[::Menu::Main.generate.to_i - 1]
  end

  def select_model
    @model = ::Models::Base.subclasses.find { |mdl| mdl::COLLECTION_NAME == option }
  end
end
