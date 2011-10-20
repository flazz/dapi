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

  def apt?
    set_envs
    apt_handler?
  end

  def apt_handler?
    apt_handler and true
  end

  def dispatch
    apt_handler? or raise 'no apt handler'
    apt_handler.dispatch
  end

  def apt_handler
    @apt_handler ||= handlers.detect { |h| h.apt? }
  end

end

class All
  include Multi

  def apt?
    set_envs
    all_apt?
  end

  def all_apt?
    handlers.all? &:apt?
  end

end
