module UnitManager
  class Unit
    require 'active_support'

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

        if multiplication_index.present? && multiplication_index <= division_index
          split_equation = multiplication(split_equation: split_equation, index: multiplication_index)
        end
        
        if division_index.present? && division_index < multiplication_index
          split_equation = division(split_equation: split_equation, index: division_index)
        end
      end

      while split_equation.index('+').present? || split_equation.index('-').present? do
        addition_index = split_equation.index('+')
        subtraction_index = split_equation.index('-')

        if addition_index.present?
          split_equation = addition(split_equation: split_equation, index: addition_index)
        end
        
        if subtraction_index.present?
          split_equation = subtraction(split_equation: split_equation, index: addition_index)
        end
      end

      result = split_equation[0]
      
      binding.pry

      result
    end

    def multiplication(split_equation:, index:)
      result = split_equation[index-1].to_i * split_equation[index+1].to_i
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result.to_s

      split_equation
    end

    def division(split_equation:, index:)
      result = split_equation[index-1].to_i / split_equation[index+1].to_i
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result.to_s

      split_equation
    end

    def addition(split_equation:, index:)
      result = split_equation[index-1].to_i + split_equation[index+1].to_i
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result.to_s

      split_equation
    end

    def subtraction(split_equation:, index:)
      result = split_equation[index-1].to_i - split_equation[index+1].to_i
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result.to_s

      split_equation
    end
  end
end