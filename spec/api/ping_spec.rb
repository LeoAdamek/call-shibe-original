require 'spec_helper'

describe Konfrence::API do
  include Rack::Test::Methods

  def app
    Konfrence::API
  end

  it "Takes a ping for /api/ping" do
    get "/api/ping"
    last_response.status.should eq 200
    last_response.body.should eq( { ping: "pong"}.to_json )
  end
end
