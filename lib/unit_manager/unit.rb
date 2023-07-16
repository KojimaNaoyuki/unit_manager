module UnitManager
  class Unit
    def initialize(key:, name:)
      @key = key
      @name = name
    end

    def unit(value:)
      "#{value}#{@name}"
    end
  end
end