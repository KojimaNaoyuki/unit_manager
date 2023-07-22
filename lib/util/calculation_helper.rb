module CalculationHelper
  def calculation_equation(split_equation:)
  
    while split_equation.index('*').present? || split_equation.index('/').present? do
      multiplication_index = split_equation.index('*').presence || UnitManager::Unit::MAX_EQUATION_SIZE
      division_index = split_equation.index('/').presence || UnitManager::Unit::MAX_EQUATION_SIZE
  
      if multiplication_index <= division_index
        multiplication(split_equation: split_equation, index: multiplication_index)
        next
      end
      
      if division_index < multiplication_index
        division(split_equation: split_equation, index: division_index)
        next
      end
    end
  
    while split_equation.index('+').present? || split_equation.index('-').present? do
      addition_index = split_equation.index('+').presence || UnitManager::Unit::MAX_EQUATION_SIZE
      subtraction_index = split_equation.index('-').presence || UnitManager::Unit::MAX_EQUATION_SIZE
  
      if addition_index <= subtraction_index
        addition(split_equation: split_equation, index: addition_index)
        next
      end
      
      if subtraction_index < addition_index
        subtraction(split_equation: split_equation, index: subtraction_index)
        next
      end
    end
  
    result = split_equation[0]
  
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
