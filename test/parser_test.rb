# frozen_string_literal: true

require 'test/unit'
require_relative '../parser.rb'

FIXTURE_FILE = File.join(File.dirname(__FILE__), 'fixtures/webserver.log')

# Tests for Parser class
class ParserTest < Test::Unit::TestCase
  def test_accepts_file
    parser = Parser.new(FIXTURE_FILE)
    assert_equal('test/fixtures/webserver.log', parser.log_file)
  end

  def test_sessions
    parser = Parser.new(FIXTURE_FILE)
    sessions = parser.sessions
    assert_equal('/help_page/1', sessions[0].path)
    assert_equal('126.318.035.038', sessions[0].ip)
  end

  def test_page_sessions
    parser = Parser.new(FIXTURE_FILE)
    assert_equal(80, parser.page_sessions[0].hits)
    assert_equal(23, parser.page_sessions[0].unique_hits)
  end

  def test_renderes_session_count
    parser = Parser.new(FIXTURE_FILE)
    assert_equal(%(/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits), parser.render(:sessions))
  end

  def test_renderes_unique_count
    parser = Parser.new(FIXTURE_FILE)
    assert_equal(%(/help_page/1 23 visits
/contact 23 visits
/home 23 visits
/index 23 visits
/about/2 22 visits
/about 21 visits), parser.render(Parser::UNIQUE))
  end
end
