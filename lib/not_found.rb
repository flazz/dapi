class NotFound
  include Handler

  def apt?
    true
  end

  def handle
    [404, headers, StringIO.new(body)]
  end

  def status
    404
  end

  def headers
    {'Content-Type' => 'text/plain' }
  end

  def body
    <<BODY
#{env['PATH_INFO']} is not found
BODY
  end

end
