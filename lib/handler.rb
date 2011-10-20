module Handler
  DEFAULT_ENV = {}
  DEFAULT_ACTION = lambda { |env| raise "action not specified" }

=begin
this class requires #apt? to be implemented
=end

  def dispatch
    action.call env
  end

  attr_writer :env
  def env
    @env ||= DEFAULT_ENV
  end

  attr_writer :action
  def action
    @action ||= DEFAULT_ACTION
  end

end
