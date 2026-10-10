# frozen_string_literal: true

rack_app = lambda do |env|
  request = Rack::Request.new(env)

  begin
    index_html_content = File.read('public/index.html')
    status = 200
  rescue StandardError
    index_html_content = File.read('public/server_error.html')
    status = 500
  end

  if request.path == '/'
    [status, { 'content-type' => 'text/html' }, [index_html_content]]
  else
    [404, { 'content-type' => 'text/plain' }, ['Not Found']]
  end
end

run rack_app
