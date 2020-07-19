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

  def render_ordered_by_most_visited
    grouped_by_path = page_visits.group_by(&:path).map do |group, data|
      { path: group, size: data.size }
    end

    sorted_group = grouped_by_path.sort_by do |item|
      -item[:size]
    end

    rendered = sorted_group.map do |item|
      "#{item[:path]} #{item[:size]} visits"
    end

    rendered.join("\n")
  end
end
