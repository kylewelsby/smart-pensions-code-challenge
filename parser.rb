# frozen_string_literal: true

require "./session"
require "./page"

# Parser for webserver log files
class Parser
  UNIQUE = "unique"
  SESSIONS = "sessions"
  attr_accessor :log_file
  def initialize(log_file)
    @log_file = log_file
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

  def pre_render(mode = SESSIONS)
    values = if mode == Parser::UNIQUE
      sorted_by_unique_visited.map do |item|
        {path: item.path, value: item.unique_hits}
      end
    else
      sorted_by_most_visited.map do |item|
        {path: item.path, value: item.hits}
      end
    end
    values
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
    pre_render(mode).map { |item|
      "#{item[:path]} #{item[:value]} visits"
    }.join("\n")
  end

  # disbaled as Rubocop doens't like the simple templating layout below.
  # unfortinately ran out of time to find a work-around.
  #
  # rubocop:disable Metrics/AbcSize
  def render_pretty(mode = SESSIONS)
    template = [
      "+-----------------+------+",
      "+ Path            + Hits +"
    ]
    template << template[0]
    pre_render(mode).each do |item|
      template << "| #{item[:path] + " " * (15 - item[:path].length)} |   #{item[:value]} |"
    end
    template << template[0]
    template.join("\n")
  end
  # rubocop:enable Metrics/AbcSize

  private

  def sessions
    data = File.read(log_file)
    sessions = []
    data.each_line do |line|
      parts = line.split(" ")
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
end

# Allow the program to return via command line
#
# Examples
#
#     ruby parser.rb ./test/fixtures/webserver.log
#
# Returns String rendered output of selected mode
puts Parser.new(ARGV[0]).render_pretty(ARGV[1]) if __FILE__ == $PROGRAM_NAME
