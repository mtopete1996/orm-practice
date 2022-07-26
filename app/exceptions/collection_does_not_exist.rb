# frozen_string_literal: true

class CollectionDoesNotExist < StandardError
  def initialize(model)
    msg = %(Collection "#{model}" does not exist)
    super(msg)
  end
end
