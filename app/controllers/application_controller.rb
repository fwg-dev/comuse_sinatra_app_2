require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # i need to enable something here
    enable :sessions
    # i need to set something here
    set :session_secret, "our_secret_session"
    # registering the sinatra flash gem
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      # redirects to users show page
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
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

    def authorized_to_edit?(post)
      current_user == post.user
    end
  end

end
