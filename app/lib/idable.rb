# frozen_string_literal: true

require 'debug'

module Idable
  private

  def calculate_id
    last_id + 1
  end

  def last_id
    self.class.all.max_by(&:id)&.id || 0
  end
end
