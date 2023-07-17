RSpec.describe UnitManager::Unit do
  it 'should be return derive unit' do
    unit = UnitManager::Unit.new(key: 'money', name: '円', equation: '<value> * 1.1')
    expect(unit.unit(100)).to eq '110円'
  end
end