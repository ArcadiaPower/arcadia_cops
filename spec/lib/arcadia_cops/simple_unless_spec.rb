# Originally from https://github.com/airbnb/ruby/blob/12435e8136d2adf710de999bc0f6bef01215df2c/rubocop-airbnb/spec/rubocop/cop/airbnb/simple_unless_spec.rb
RSpec.describe ArcadiaCops::SimpleUnless, :config do
  let(:config) { RuboCop::Config.new }

  it 'rejects unless with multiple conditionals' do
    expect_offense(<<~RUBY)
      unless boolean_condition || another_method
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleUnless: Unless usage is okay when there is only one conditional
        return true
      end
    RUBY
  end

  it 'allows if with multiple conditionals' do
    expect_no_offenses(<<~RUBY)
      if boolean_condition || another_method
        return true
      end
    RUBY
  end

  it 'allows with modifier if operator conditional' do
    expect_no_offenses(<<~RUBY)
      unless boolean_condition
        return true
      end
    RUBY
  end
end
