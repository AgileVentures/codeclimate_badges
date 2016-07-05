def start_sinatra_app(options, &block)
  raise ArgumentError.new("You must pass a port") unless options[:port]

  require 'sinatra'
  require 'support/vcr_localhost_server'
  klass = Class.new(Sinatra::Base)
  klass.disable :protection
  klass.class_eval(&block)

  VCR::LocalhostServer.new(klass.new, options[:port])
end

$server = start_sinatra_app({port: 7654}) do
  get('/') { "Hello" }
end

def make_http_request
  Net::HTTP.get_response('localhost', '/', $server.port).body
end

require 'spec_helper'

describe "VCR example group metadata", :vcr do
  it 'records an http request' do
    expect(make_http_request).to eq('Hello')
  end

  it 'records another http request' do
    expect(make_http_request).to eq('Hello')
  end

  context 'in a nested example group' do
    it 'records another one' do
      expect(make_http_request).to eq('Hello')
    end
  end
end

describe "VCR example metadata" do
  it 'records an http request', :vcr do
    expect(make_http_request).to eq('Hello')
  end
end