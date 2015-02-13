require 'sinatra'
require 'haml'
require 'json'
require 'colorize'
require 'csv_to_popolo'

#---------------------------------------------------------------------
# Static pages
#---------------------------------------------------------------------

get '/' do
  haml :index
end

post '/convert' do
  file = params[:csv][:tempfile] or error { "Didn't get a file" }
  content_type :json
  JSON.pretty_generate(Popolo::CSV.from_file(file).data)
end

helpers do

end



