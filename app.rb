require 'sinatra'
require 'haml'
require 'json'
require 'colorize'

#---------------------------------------------------------------------
# Static pages
#---------------------------------------------------------------------

get '/' do
  haml :index
end


helpers do

end



