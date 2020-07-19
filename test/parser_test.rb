# frozen_string_literal: true

require 'test/unit'
require './parser.rb'

# Tests for Parser class
class ParserTest < Test::Unit::TestCase
  def test_accepts_file
    parser = Parser.new('./webserver.log')
    assert_equal('./webserver.log', parser.log_file)
  end

  def test_renderes_output
    parser = Parser.new('./webserver.log')
    assert_equal("/home 90 visits\n/index 80 visits", parser.render)
  end
end
