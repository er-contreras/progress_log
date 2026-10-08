# frozen_string_literal: true

require 'rack'

status = 200

html_content = File.read('index.html')
body = [html_content]

headers = {
  'Content-Type' => 'text/html',
  'Content-length' => html_content.bytesize.to_s
}

run ->(_) { [status, headers, body] }
