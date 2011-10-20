module Multi
  include Handler
  attr_reader :handlers

  def initialize(handlers, &blk)
    @handlers = handlers
    action = blk
  end

  def set_envs
    handlers.each { |h| h.env = env }
  end

end

class First
  include Multi

  def handle?
    set_envs

    if first_apt_handler
      true
    else
      raise 'no apt handler'
    end
  end

  def handle
    first_apt_handler.handle
  end

  def first_apt_handler
    @first_handler ||= handlers.detect { |h| h.handle? }
  end

end

class All
  include Multi

  def handle?
    set_envs
    all_handle?
  end

  def all_handle?
    handlers.all? &:handle?
  end

end

