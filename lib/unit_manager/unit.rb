module UnitManager
  class Unit
    require 'active_support'
    require_relative '../util/calculation_helper'
    include CalculationHelper

    MAX_EQUATION_SIZE = 999
    INVALID_EQUATION_SYMBOL = ["(", ")", "!", "&", "%"]

    def initialize(key:, name:, equation:)
      @key = key
      @name = name
      @equation = equation
    end

    def unit(value)
      "#{derive_value(value)}#{@name}"
    end

    private

    def derive_value(value)
      split_equation = @equation.split

      split_equation.map! { |array_value| array_value == "<value>" ? value.to_s : array_value }

      calculation_equation(split_equation: split_equation)
    end
  end
end
