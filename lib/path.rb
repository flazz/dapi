class Path
  include Handler
  attr_reader :path

  def initialize(path, &blk)
    @path = path
    action = blk
  end

  def handle?
    path == request_path
  end

  def request_path
    env['PATH_INFO']
  end

end
