ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'minitest/autorun'
require 'rack/test'
include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "viewer" do

  describe "when viewing the home page" do

    before { get '/' }

    it "should have show some text" do
      last_response.body.must_include 'What is this'
    end

  end

end

