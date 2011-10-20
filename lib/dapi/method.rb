module Dapi

  class Method
    include Handler

    def http_method
      env['REQUEST_METHOD']
    end

  end

  class Post < Method

    def apt?
      http_method == 'POST'
    end

  end

  class Get < Method

    def apt?
      http_method == 'GET'
    end

  end

end
