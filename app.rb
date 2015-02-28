require 'sinatra'
require 'haml'
require 'json'
require 'csv_to_popolo'
require 'rack/cors'

use Rack::Logger

use Rack::Cors do
  allow do
    origins '*'
    resource '/convert', :headers => :any, :methods => :post
  end
end

get '/' do
  haml :index
end

post '/convert' do
  content_type :json
  begin
    file = params[:csv][:tempfile] 
  rescue 
    raise "No file submitted"
  end
  logger.info "---CSV--- #{File.foreach(file).first(6)} ---END---"
  JSON.pretty_generate(Popolo::CSV.new(file).data)
end

# Can't use built-in until 1.3
# http://stackoverflow.com/questions/5995854/logging-in-sinatra
helpers do
  def logger
    request.logger
  end
end



