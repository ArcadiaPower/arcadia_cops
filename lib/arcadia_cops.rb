# frozen_string_literal: true

require 'rubocop'
Dir.glob(File.expand_path('arcadia_cops/*.rb', File.dirname(__FILE__))).map(&method(:require))
