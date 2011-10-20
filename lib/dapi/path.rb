module Dapi

  class Path
    include Handler
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def apt?
      path == request_path
    end

    def request_path
      env['REQUEST_PATH']
    end

  end

end
