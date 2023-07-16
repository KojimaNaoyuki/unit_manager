module UnitManager
  class InitializeUnit
    require 'yaml'
    require_relative 'unit'

    attr_reader :units

    def initialize
      units_hash = open("#{Dir::pwd}/lib/unit_manager/unit.yml", 'r') { |f| YAML.load(f) }

      units = units_hash['units'].each_with_object({}) do |unit, units|
        units["#{unit['key']}"] = UnitManager::Unit.new(key: unit['key'], name: unit['name'])
      end

      @units = units
    end
  end
end