class UsersController < ApplicationController

  # initial login route to render login form
  get '/login' do
    erb :'/users/login'
  end

  # recieve the params from our login form
  post '/login' do
    # find the user
    @user = User.find_by(email: params[:email])
    # authenticate the user
    if @user && @user.authenticate(params[:password])

      # log the user in by creating key/value pair in session hash
      session[:user_id] = @user.id


      # redirect to the users profile (show/profile, index, dashboard)
      redirect "/users/#{@user.id}"

    else
      binding.pry
      # show error message
      # redirect them back to login
      redirect '/login'
    end
  end

  #users show page
  get '/users/:id' do
    "Users show route!"
  end

end
