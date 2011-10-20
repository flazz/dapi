module Dapi

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

end
