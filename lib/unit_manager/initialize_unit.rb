module UnitManager
  class InitializeUnit
    require 'yaml'
    require_relative 'unit'

    attr_reader :units

    def initialize
      units_hash = open('./unit.yml', 'r') { |f| YAML.load(f) }

      units = units_hash[:units].map do |unit|
        UnitManager::Unit.new(key: unit[:key])
      end

      @units = units
    end
  end
end