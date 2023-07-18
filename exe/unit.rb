#!/usr/bin/env ruby

Dir.mkdir('unit_config') unless Dir.exist?('unit_config')
File.new('unit_config/unit.yml', 'w') unless File.exist?("unit_config/unit.yml")

ENV['unit_config_path'] = "#{Dir.pwd}/unit_config/unit.yml"

puts('=== Initialize Exit ===')
puts('- unit_config/unit.yml')