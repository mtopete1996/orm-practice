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
    def get(*copy_path)
      msg = instance.object.dig(LANGUAGE, *copy_path)
      raise(CopyNotFound, copy_path) if msg.nil? || !msg.instance_of?(String)

      msg
    end
  end
end
