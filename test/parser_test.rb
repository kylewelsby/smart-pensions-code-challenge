# frozen_string_literal: true

require 'test/unit'
require_relative '../parser.rb'

FIXTURE_FILE = File.join(File.dirname(__FILE__), 'fixtures/webserver.log')

# Tests for Parser class
class ParserTest < Test::Unit::TestCase
  def test_accepts_file
    parser = Parser.new(FIXTURE_FILE)
    assert_equal('./webserver.log', parser.log_file)
  end

  def test_renderes_output
    parser = Parser.new(FIXTURE_FILE)
    assert_equal("/home 90 visits\n/index 80 visits", parser.render)
  end

  def test_parse_file
    parser = Parser.new(FIXTURE_FILE)
    page_visits = parser.page_visits
    assert_equal("/help_page/1", page_visits[0].path)
    assert_equal("126.318.035.038", page_visits[0].ip)
  end
end
