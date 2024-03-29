# Originally from https://github.com/airbnb/ruby/blob/12435e8136d2adf710de999bc0f6bef01215df2c/rubocop-airbnb/spec/rubocop/cop/airbnb/simple_unless_spec.rb
describe ArcadiaCops::SimpleUnless do
  subject(:cop) { described_class.new }

  it 'rejects unless with multiple conditionals' do
    source = [
      'unless boolean_condition || another_method',
      '  return true',
      'end',
    ].join("\n")

    inspect_source(source)
    expect(cop.offenses.size).to eq(1)
  end

  it 'allows if with multiple conditionals' do
    source = [
      'if boolean_condition || another_method',
      '  return true',
      'end',
    ].join("\n")

    inspect_source(source)
    expect(cop.offenses).to be_empty
  end

  it 'allows with modifier if operator conditional' do
    source = [
      'unless boolean_condition',
      '  return true',
      'end',
    ].join("\n")

    inspect_source(source)
    expect(cop.offenses).to be_empty
  end
end
