# frozen_string_literal: true

ENTRIES = %w[./app/lib ./app/models/behaviors ./app/models].freeze

ENTRIES.each do |folder|
  Dir.entries(folder).drop(2).each do |path|
    next unless path =~ /.*\.rb$/

    puts "Loading #{path} ..."
    load File.join(folder, path)
  end
end
