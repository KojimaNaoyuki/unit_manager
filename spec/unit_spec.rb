RSpec.describe UnitManager::Unit do
  describe '#unit' do
    it 'should be return derive unit' do
      unit = UnitManager::Unit.new(key: 'money', name: '円', equation: '<value> * 1.1')
      value = 100
      expect(unit.unit(value)).to eq "#{(value * 1.1).round}円"
    end

    context 'when the equation contains multiplication and division' do
      it 'should be return derive unit' do
        unit = UnitManager::Unit.new(key: 'money', name: 'original_unit', equation: '<value> * 2 / 1.5')
        value = 100
        expect(unit.unit(value)).to eq "#{(value * 2 / 1.5).round}original_unit"
      end
    end

    context 'when the equation contains addition and subtraction' do
      it 'should be return derive unit' do
        unit = UnitManager::Unit.new(key: 'money', name: 'original_unit', equation: '<value> + 50 - 30 + 100')
        value = 100
        expect(unit.unit(value)).to eq "#{(value + 50 - 30 + 100).round}original_unit"
      end
    end

    context 'when the equation contains multiplication, division, addition and subtraction' do
      it 'should be return derive unit' do
        unit = UnitManager::Unit.new(key: 'money', name: 'original_unit', equation: '<value> * 2.5 / 3 + 100 * 100')
        value = 100
        expect(unit.unit(value)).to eq "#{(value * 2.5 / 3 + 100 * 100).round}original_unit"
      end
    end

    context 'when the position of the value of the equation is in the middle' do
      it 'should be return derive unit' do
        unit = UnitManager::Unit.new(key: 'money', name: 'original_unit', equation: '100 + 2 * <value> / 2')
        value = 100
        expect(unit.unit(value)).to eq "#{(100 + 2 * value / 2).round}original_unit"
      end
    end
  end
end