## Dapi: Dispatch API

an **experiment** in routing off the rails (in plain ruby on rack)

## Implement a handler

handler is probably the wrong term. ***dispatcher***?

```ruby
class NiceHandler
  include Dapi::Handler

  def apt?
    env['REQUEST_PATH'] == 'nice'
  end
end
```

## Can it handle the truth?

```ruby
nice_handler = NiceHander.new
nice_handler.env = env # give it a rack env
nice_handler.apt? # => true or false
```

## Connect to an action

not a rails action. i don't know a better name. ***dispatchee***?

actions are normal rack apps, but you probably want to hook up to some
controller-like thing.

it doesn't know about any type of controllers you have to figure out how to
smartly connect them.

```ruby
nice_handler = NiceHander.new
nice_handler.action = lambda do |env|
  [200, {'Content-Type' => 'text/plain' }, StringIO.new("this is nice\n") ]
end
nice_handler.dispatch # runs the lambda
```

# Compositions

A bit if operator sugar, not a DSL, See the `First` and `All` classes.
No reason you cant make a DSL on top.

## Union

dispatch the first match

```ruby
a_union = some_handler | another | and_another

```

## Intersection

all must match for dispatch

```ruby
some_requirement & and_another
```

## More complex example

**put this in a config.ru and then rackup**

```ruby
require 'dapi'

post = Dapi::Post.new # match a post
path = Dapi::Path.new('/abc') # match the path /abc
post_abc = post & path # match post and path

post_abc.action = lambda do |env|
  body = StringIO.new
  body.puts 'you POSTed to abc'
  body.rewind
  [ 200, {'Content-Type' => 'text/plain' }, body ]
end

not_found = Dapi::NotFound.new

app = lambda do |env|
  routes = post_abc | path | post | not_found
  routes.env = env
  routes.dispatch
end

run app
```
