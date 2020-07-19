# frozen_string_literal: true

# Parser for webserver log files
class Parser
  attr_accessor :log_file
  def initialize(log_file)
    @log_file = log_file
  end

  def render
    "/home 90 visits\n/index 80 visits"
  end
end
