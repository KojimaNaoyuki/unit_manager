#!/usr/bin/env ruby

GEM_INSTALL_PATH = __dir__.slice!(0, __dir__.size-4)

def confirmation
  unit_config_path_file = File.open("#{GEM_INSTALL_PATH}/config/unit_config_path.txt", 'r')
  unit_config_path = unit_config_path_file.read
  unit_config_path_file.close
  puts unit_config_path_file
end

def init
  Dir.mkdir('unit_config') unless Dir.exist?('unit_config')
  File.new('unit_config/unit.yml', 'w') unless File.exist?("unit_config/unit.yml")

  File.open("#{GEM_INSTALL_PATH}/config/unit_config_path.txt", mode = 'w') do | f |
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