# frozen_string_literal: true

require 'find'

Find.find('app') do |path|
  load path if path =~ /.*\.rb$/
end
