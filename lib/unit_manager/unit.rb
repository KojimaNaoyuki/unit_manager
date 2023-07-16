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
      
    end
  end
end