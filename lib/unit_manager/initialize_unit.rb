module UnitManager
  class InitializeUnit
    require 'yaml'
    require_relative 'unit'

    attr_reader :units

    # TODO: この二つ、ココではなくてunitクラスにあるべきだから移動
    MAX_EQUATION_SIZE = 999
    INVALID_EQUATION_SYMBOL = ["(", ")", "!", "&", "%"]

    def initialize
      units_hash = open(unit_config_path, 'r') { |f| YAML.load(f) }

      units = units_hash['units'].each_with_object({}) do |unit, units|
        split_equation = unit['equation'].split
        raise InvalidEquation, "too long equation invalid: #{unit['equation']}" if MAX_EQUATION_SIZE < split_equation.size
        raise InvalidEquation, "<value> does not exist equation invalid: #{unit['equation']}" unless split_equation.include?('<value>')
        raise InvalidEquation, "equationv contains invalid symbol: #{unit['equation']}" if split_equation.any? {|equation_symbol| INVALID_EQUATION_SYMBOL.include?(equation_symbol)}

        units["#{unit['key']}"] = UnitManager::Unit.new(key: unit['key'], name: unit['name'], equation: unit['equation'])
      end

      @units = units
    end

    def unit_config_path
      gem_install_path = __dir__.slice!(0, __dir__.size-17)

      unit_config_path_file = File.open("#{gem_install_path}/config/unit_config_path.txt", 'r')
      unit_config_path = unit_config_path_file.read
      unit_config_path_file.close

      unit_config_path
    end
  end
end