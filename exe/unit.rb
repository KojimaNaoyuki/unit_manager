#!/usr/bin/env ruby

def confirmation
  puts "unit_config_path: #{ENV['unit_config_path']}"
end

def init
  Dir.mkdir('unit_config') unless Dir.exist?('unit_config')
  File.new('unit_config/unit.yml', 'w') unless File.exist?("unit_config/unit.yml")

  File.open("#{__dir__}/config/unit_config_path.txt", mode = 'w') do | f |
    f.write("#{Dir.pwd}/unit_config/unit.yml")
  end
  
  puts '=== Initialize Exit ==='
  puts '- unit_config/unit.yml'
end


case ARGV[0]
when 'init'
  init
when 'confirmation'
  confirmation
else
  puts 'command does not exist'
end