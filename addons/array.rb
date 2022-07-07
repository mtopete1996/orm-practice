# frozen_string_literal: true

class Array
  def except(*args)
    reject { |item| args.include?(item) }
  end

  def not_empty?
    !empty?
  end

  def only(*args)
    filter { |item| args.include?(item) }
  end
end
