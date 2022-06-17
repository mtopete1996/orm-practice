# frozen_string_literal: true

require 'psych'

class SchemasReader
  SCHEMAS_PATH = 'app/schemas'

  class << self
    def collection_names
      schema.to_a.map { |model| model[1][:collection_name] }
    end

    def file_names
      Dir.entries(SCHEMAS_PATH).drop(2)
    end

    def schema
      @schema ||= file_names.each_with_object({}) do |file, schema|
        schema.merge!(Psych.safe_load_file(File.join(path, file), symbolize_names: true))
      end
    end

    private

    def clean
      file_names.map { |file| file.split('.').first }
    end

    def path
      File.join(Dir.pwd, SCHEMAS_PATH)
    end
  end
end
