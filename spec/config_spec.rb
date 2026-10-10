# frozen_string_literal: true

require 'rack'
require 'rack/test'
require 'rspec'
require 'json'

RSpec.describe 'config.ru' do
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file('config.ru')
  end

  it 'evaluate for a 200 ok response' do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.headers).to include('content-type' => 'text/html')
    expect(last_response.body).to include('<h1>Progress Log</h1>')
  end

  it 'target a path where file is expected but missing' do
    allow(File).to receive(:read).and_call_original
    allow(File).to receive(:read).with('public/index.html').and_raise(Errno::ENOENT)

    get '/'

    expect(last_response).to be_server_error
    expect(last_response.body).to include('<h1>Internal Server Error</h1>')
  end

  it 'reach a not found 404 response' do
    get '/invalid_path'

    expect(last_response).to be_not_found
  end
end
