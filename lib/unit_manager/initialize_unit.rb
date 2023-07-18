module UnitManager
  class InitializeUnit
    require 'yaml'
    require_relative 'unit'

    attr_reader :units

    def initialize
      units_hash = open("#{ENV['unit_config_path']}/unit.yml", 'r') { |f| YAML.load(f) }

      units = units_hash['units'].each_with_object({}) do |unit, units|
        units["#{unit['key']}"] = UnitManager::Unit.new(key: unit['key'], name: unit['name'], equation: unit['equation'])
      end

      @units = units
    end
  end
end