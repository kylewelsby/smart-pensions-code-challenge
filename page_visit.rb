# frozen_string_literal: true

# Page visit class for each row of server log
class PageVisit
  attr_accessor :path, :ip
  def initialize(path, ip)
    @path = path
    @ip = ip
  end
end
