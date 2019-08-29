require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # i need to enable something here
    enable :sessions
    # i need to set something here
    set :session_secret, "our_secret_session"
  end

  get "/" do
    erb :welcome
  end

end
