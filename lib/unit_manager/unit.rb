module UnitManager
  class Unit
    def initialize(key:)
      @key = key
      @value = 0
    end

    def unit
      "#{@value}#{@key}"
    end
  end
end