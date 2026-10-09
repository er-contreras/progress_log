rack_app = lambda do |env|
  [200, { 'content-type' => 'text/plain' }, ['Hello World']]
end

run rack_app
