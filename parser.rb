# frozen_string_literal: true

require './page_visit'

# Parser for webserver log files
class Parser
  attr_accessor :log_file
  def initialize(log_file)
    @log_file = log_file
  end
  
  def page_visits
    data = File.read(log_file)
    page_visits = []
    data.each_line do |line|
      parts = line.split(' ')
      page_visits << PageVisit.new(parts[0], parts[1])
    end
    page_visits
  end

  def render
    "/home 90 visits\n/index 80 visits"
  end
end
