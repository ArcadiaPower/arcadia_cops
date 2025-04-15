# Originally from https://github.com/airbnb/ruby/blob/12435e8136d2adf710de999bc0f6bef01215df2c/rubocop-airbnb/spec/rubocop/cop/airbnb/simple_modifier_conditional_spec.rb
RSpec.describe ArcadiaCops::SimpleModifierConditional, :config do
  let(:config) { RuboCop::Config.new }

  context 'multiple conditionals' do
    it 'rejects with modifier if with multiple conditionals' do
      expect_offense(<<~RUBY)
        return true if some_method == 0 || another_method
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
      RUBY
    end

    it 'rejects with modifier unless with multiple conditionals' do
      expect_offense(<<~RUBY)
        return true unless true && false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
      RUBY
    end

    it 'allows with modifier if operator conditional' do
      expect_no_offenses(<<~RUBY)
        return true if some_method == 0
      RUBY
    end

    it 'allows with modifier if with single conditional' do
      expect_no_offenses(<<~RUBY)
        return true if some_method == 0
        return true if another_method
      RUBY
    end

    it 'allows with modifier if and unless with single conditional ' do
      expect_no_offenses(<<~RUBY)
        return true if some_method
        return true unless another_method > 5
      RUBY
    end

    it 'allows multiple conditionals in block form' do
      expect_no_offenses(<<~RUBY)
        if some_method == 0 && another_method > 5 || true || false
         return true
        end
      RUBY
    end
  end

  context 'multiple lines' do
    it 'rejects modifier conditionals that span multiple lines' do
      expect_offense(<<~RUBY)
        return true if true ||
        ^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
                       false
        return true unless true ||
        ^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
                           false
      RUBY
    end

    it 'rejects with modifier if with method that spans multiple lines' do
      expect_offense(<<~RUBY)
        return true if some_method(param1,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
                                   param2,
                                   param3)
        return true unless some_method(param1,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
                                       param2,
                                       param3)
      RUBY
    end

    it 'rejects inline if/unless after a multiline statement' do
      expect_offense(<<~RUBY)
        return some_method(
        ^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
          param1,
          param2,
          param3
        ) if another_method == 0
        return some_method(
        ^^^^^^^^^^^^^^^^^^^ ArcadiaCops/SimpleModifierConditional: Modifier if/unless usage is okay when the body is simple, the condition is simple, and the whole thing fits on one line. Otherwise, avoid modifier if/unless.
          param1,
          param2,
          param3
        ) unless another_method == 0
      RUBY
    end

    it 'allows multline conditionals in block form' do
      expect_no_offenses(<<~RUBY)
        if some_method(param1,
                       param2,
                       parma3)
         return true
        end
      RUBY
    end
  end
end
