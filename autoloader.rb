# frozen_string_literal: true

require 'debug'

VERBOSE = false
ENTRIES = %w[
  ./addons
  ./app/exceptions
  ./app/lib
  ./app/lib/menu
  ./app/models/behaviors
  ./app/models
].freeze

ENTRIES.each do |folder|
  Dir.entries(folder).drop(2).each do |path|
    next unless path =~ /.*\.rb$/

    puts "Loading #{path} ..." if VERBOSE
    load File.join(folder, path)
  end
end

puts "-----------------------------\n\n" if VERBOSE
