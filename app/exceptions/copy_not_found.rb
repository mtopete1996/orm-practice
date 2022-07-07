# frozen_string_literal: true

class CopyNotFound < StandardError
  def initialize(copy_path)
    msg = %(Copy "#{copy_path.join(' > ')}" not found)
    super(msg)
  end
end
