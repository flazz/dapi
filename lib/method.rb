class RequestMethod
  include Handler

  def http_method
    env['REQUEST_METHOD']
  end

end

class Post < RequestMethod

  def apt?
    http_method == 'POST'
  end

end

class Get < RequestMethod

  def apt?
    http_method == 'GET'
  end

end
