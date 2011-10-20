require 'dapi'

abc_path = Path.new('/abc') do
  body = StringIO.new
  body.puts 'you hit abc'
  [ 200, {'Content-Type' => 'text/plain' }, body ]
end

post = Post.new

post_abc_path = All.new([post, abc_path])
post_abc_path.action = lambda do |env|
  body = StringIO.new
  body.puts 'you POSTed to abc'
  [ 200, {'Content-Type' => 'text/plain' }, body ]
end

not_found = NotFound.new

HANDLERS = [ post_abc_path, abc_path, post, not_found ]

APP = lambda do |env|
  handlers = HANDLERS.map &:dup
  first = First.new handlers
  first.env = env
  first.handle
end

run APP
