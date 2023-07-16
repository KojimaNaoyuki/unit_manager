module UnitManager
  class Unit
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

      multiplication_index = split_equation.index('*')
      division_index = split_equation.index('/')
      addition_index = split_equation.index('+')
      subtraction_index = split_equation.index('-')
    end

    def multiplication(split_equation:, index:)
      result = split_equation[index-1] * split_equation[index+1]
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result

      split_equation
    end

    def division(split_equation:, index:)
      result = split_equation[index-1] / split_equation[index+1]
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result

      split_equation
    end

    def addition(split_equation:, index:)
      result = split_equation[index-1] + split_equation[index+1]
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result

      split_equation
    end

    def subtraction(split_equation:, index:)
      result = split_equation[index-1] - split_equation[index+1]
      split_equation.slice!(index, index+1)
      split_equation[index-1] = result

      split_equation
    end
  end
end