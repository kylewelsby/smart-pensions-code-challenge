# frozen_string_literal: true

# class that represents a page and all its sessions
class Page
  attr_accessor :path, :sessions
  def initialize(path, sessions)
    @path = path
    @sessions = sessions
  end

  def hits
    sessions.size
  end

  def unique_hits
    sessions.group_by(&:ip).size
  end
end
