require 'sinatra'
require 'haml'
require 'json'
require 'csv_to_popolo'

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



