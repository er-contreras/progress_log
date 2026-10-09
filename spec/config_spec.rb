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

  it 'Evaluate for a 200 ok response' do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.headers).to eq('content-length' => '11', 'content-type' => 'text/plain')
    expect(last_response.body).to eq('Hello World')
  end
end
