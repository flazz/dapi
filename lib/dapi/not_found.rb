module Dapi

  class NotFound
    include Handler

    def apt?
      true
    end

    def dispatch
      [404, headers, body]
    end

    def status
      404
    end

    def headers
      {'Content-Type' => 'text/plain' }
    end

    def body
      StringIO.new "#{path} is not found"
    end

    def path
      env['REQUEST_PATH']
    end

  end

end
