class PageVisit
  attr_accessor :path, :ip
  def initialize(path, ip)
    @path = path
    @ip = ip
  end
end