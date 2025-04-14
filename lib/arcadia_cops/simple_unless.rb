# frozen_string_literal: true

module ArcadiaCops
  # Cop to tackle prevent unless statements with multiple conditions
  # https://github.com/airbnb/ruby/blob/12435e8136d2adf710de999bc0f6bef01215df2c/rubocop-airbnb/lib/rubocop/cop/airbnb/simple_unless.rb
  class SimpleUnless < RuboCop::Cop::Base
    MSG = 'Unless usage is okay when there is only one conditional'.freeze

    def_node_matcher :multiple_conditionals?, '(if ({and or :^} ...) ...)'

    def on_if(node)
      return unless node.unless?

      add_offense(node) if multiple_conditionals?(node)
    end
  end
end
