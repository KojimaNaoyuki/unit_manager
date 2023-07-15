module UnitManager
  class Unit
    def initialize(name:, value:)
      @name = '円'
      @value = 1
    end

    def get_unit
      "#{@value + @name}"
    end
  end
end