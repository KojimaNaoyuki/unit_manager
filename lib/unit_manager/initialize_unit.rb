module UnitManager
  class InitializeUnit
    require 'yaml'
    require_relative 'unit'

    attr_reader :units

    GEM_INSTALL_PATH = File.expand_path('..')

    def initialize
      unit_config_path_file = File.open("#{GEM_INSTALL_PATH}/config/unit_config_path.txt", 'r')
      unit_config_path = unit_config_path_file.read
      unit_config_path_file.close
      puts unit_config_path_file

      units_hash = open("#{ENV['unit_config_path']}", 'r') { |f| YAML.load(f) }

      units = units_hash['units'].each_with_object({}) do |unit, units|
        units["#{unit['key']}"] = UnitManager::Unit.new(key: unit['key'], name: unit['name'], equation: unit['equation'])
      end

      @units = units
    end
  end
end