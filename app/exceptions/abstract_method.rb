# frozen_string_literal: true

class AbstractMethod < StandardError
  def initialize(msg = 'You must define this method')
    super
  end
end
