# frozen_string_literal: true

require 'singleton'
require 'psych'

class Coppier
  include Singleton

  attr_reader :object

  LANGUAGE = :en
  COPIES_PATH = File.join(Dir.pwd, 'copies.yml')

  def initialize
    @object = Psych.safe_load_file(COPIES_PATH, symbolize_names: true)
  end

  class << self
    def get(*key_path)
      instance.object.dig(LANGUAGE, *key_path)
    end
  end
end
