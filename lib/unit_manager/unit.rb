module UnitManager
  attr_writer :value

  class Unit
    def initialize(key:, name:)
      @key = key
      @name = name
      @value = 0
    end

    def unit
      "#{@value}#{@name}"
    end
  end
end