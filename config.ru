require 'dapi'

post = Dapi::Post.new # match a post
path = Dapi::Path.new('/abc') # match the path /abc
post_abc = post & path # match post and path

# action is a regular rack app
post_abc.action = lambda do |env|
  body = StringIO.new
  body.puts 'you POSTed to abc'
  body.rewind
  [ 200, {'Content-Type' => 'text/plain' }, body ]
end

not_found = Dapi::NotFound.new

app = lambda do |env|

  # Union of routes short-circuits
  routes = post_and_path | path | post | not_found
  routes.env = env
  routes.dispatch
end

run app
