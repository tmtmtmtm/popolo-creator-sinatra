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
  content_type :json
  begin
    file = params[:csv][:tempfile] 
  rescue 
    raise "No file submitted"
  end
  JSON.pretty_generate(Popolo::CSV.from_file(file).data)
end

helpers do

end



