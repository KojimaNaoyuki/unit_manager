#!/usr/bin/env ruby

case ARGV[0]
when 'init'
  init
when 'confirmation'
  confirmation
else
  puts 'command does not exist'
end


def confirmation
  puts "unit_config_path: #{ENV['unit_config_path']}"
end

def init
  Dir.mkdir('unit_config') unless Dir.exist?('unit_config')
  File.new('unit_config/unit.yml', 'w') unless File.exist?("unit_config/unit.yml")
  
  ENV['unit_config_path'] = "#{Dir.pwd}/unit_config/unit.yml"
  
  puts '=== Initialize Exit ==='
  puts '- unit_config/unit.yml'
end
