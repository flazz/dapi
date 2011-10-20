module Dapi

  # includers needs #apt?
  module Handler # TODO is thi the best name?
    include Algebra

    DEFAULT_ENV = {}
    DEFAULT_ACTION = lambda { |env| raise 'no action' }

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

end
