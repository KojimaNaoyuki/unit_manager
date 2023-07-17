module UnitManager
  class Unit
    require 'active_support'
    require "pry"

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
    
    def calculation_equation(split_equation:)

      binding.pry

      while split_equation.index('*').present? || split_equation.index('/').present? do
        multiplication_index = split_equation.index('*').presence || 1000
        division_index = split_equation.index('/').presence || 1000

        binding.pry

        if multiplication_index.present? && multiplication_index <= division_index
          multiplication(split_equation: split_equation, index: multiplication_index)
          next
        end
        
        if division_index.present? && division_index < multiplication_index
          division(split_equation: split_equation, index: division_index)
          next
        end
      end

      while split_equation.index('+').present? || split_equation.index('-').present? do
        addition_index = split_equation.index('+').presence || 1000
        subtraction_index = split_equation.index('-').presence || 1000

        binding.pry

        if addition_index.present? && addition_index <= subtraction_index
          addition(split_equation: split_equation, index: addition_index)
          next
        end
        
        if subtraction_index.present? && subtraction_index < addition_index
          subtraction(split_equation: split_equation, index: subtraction_index)
          next
        end
      end

      result = split_equation[0]
      
      binding.pry

      result.to_f.round
    end

    def multiplication(split_equation:, index:)
      result = split_equation[index-1].to_f * split_equation[index+1].to_f
      split_equation.slice!(index, 2)
      split_equation[index-1] = result.to_s
    end

    def division(split_equation:, index:)
      result = split_equation[index-1].to_f / split_equation[index+1].to_f
      split_equation.slice!(index, 2)
      split_equation[index-1] = result.to_s
    end

    def addition(split_equation:, index:)
      result = split_equation[index-1].to_f + split_equation[index+1].to_f
      split_equation.slice!(index, 2)
      split_equation[index-1] = result.to_s
    end

    def subtraction(split_equation:, index:)
      result = split_equation[index-1].to_f - split_equation[index+1].to_f
      split_equation.slice!(index, 2)
      split_equation[index-1] = result.to_s
    end
  end
end