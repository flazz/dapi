require 'multi'

class Dispatcher
  attr_reader :handlers

  def handlers
    @handlers ||= []
  end

  def handler_duplicates
    handlers.map(&:dup)
  end

  def << handler
    handlers << handler
  end

  def call env
    first = First.new handler_duplicates
    first.env = env
    first.handle
  end

end
