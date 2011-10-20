module Dapi

  # TODO should this be made binary? could be simpler
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
      apt? or raise 'no apt handler'
      apt_handler.dispatch
    end

    def apt_handler
      @apt_handler ||= handlers.detect { |h| h.apt? }
    end

  end

end
