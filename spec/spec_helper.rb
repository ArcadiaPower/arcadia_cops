require File.expand_path('lib/arcadia_cops')
require 'rubocop'
require 'rubocop/rspec/support'

RSpec.configure do |config|
  config.include RuboCop::RSpec::ExpectOffense
  # This is needed for RuboCop::Cop::Base in newer RuboCop versions
  config.define_derived_metadata(file_path: Regexp.new('spec/lib/arcadia_cops')) do |metadata|
    metadata[:config] = true
  end
  
  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect # Disable `should`
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect # Disable `should_receive` and `stub`
  end
end
