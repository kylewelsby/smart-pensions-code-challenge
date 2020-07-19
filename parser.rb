# frozen_string_literal: true

require './session'
require './page'

# Parser for webserver log files
class Parser
  UNIQUE = 'unique'
  SESSIONS = 'sessions'
  attr_accessor :log_file
  def initialize(log_file)
    @log_file = log_file
  end

  def sessions
    data = File.read(log_file)
    sessions = []
    data.each_line do |line|
      parts = line.split(' ')
      sessions << Session.new(parts[0], parts[1])
    end
    sessions
  end

  def grouped_by_path
    sessions.group_by(&:path)
  end

  def page_sessions
    grouped_by_path.map do |path, data|
      Page.new(path, data)
    end
  end

  # Sort page sessions by hit count descending
  def sorted_by_most_visited
    page_sessions.sort_by do |item|
      -item.hits
    end
  end

  # Sort page sessions by unique hits descending
  def sorted_by_unique_visited
    page_sessions.sort_by do |item|
      -item.unique_hits
    end
  end

  # Public: Render as a string in expected program format
  #
  # mode - The Constant mode switch
  #
  # Examples
  #
  #   render(Parser::UNIQUE)
  #   => `/index 1 visits\n/about 1 visits`
  #
  # Returns an ordered string seperated by new lines
  def render(mode = SESSIONS)
    pages = if mode == Parser::UNIQUE
              sorted_by_unique_visited.map do |item|
                "#{item.path} #{item.unique_hits} visits"
              end
            else
              sorted_by_most_visited.map do |item|
                "#{item.path} #{item.hits} visits"
              end
            end

    pages.join("\n")
  end
end

# Allow the program to return via command line
#
# Examples
#
#     ruby parser.rb ./test/fixtures/webserver.log
#
# Returns String rendered output of selected mode
puts Parser.new(ARGV[0]).render(ARGV[1]) if __FILE__ == $PROGRAM_NAME
