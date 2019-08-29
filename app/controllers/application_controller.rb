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

  helpers do
    # keep track of/find the current user
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    # return a boolen if user is logged in
    def logged_in?
      # current_user will return nil or the user object (we want true or false)
      # can add double bang operator to return true or false
      # will our boolean method decalaration error out?
      current_user
    end

  end

end
