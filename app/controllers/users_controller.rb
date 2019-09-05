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
      # show error message
      # redirect them back to login
      redirect '/login'
    end
  end

  # initial sign up route
  get '/signup' do
    #render my sign up form
    erb :'/users/signup'
  end

  # accept sign up params and create a user
  post '/signup' do
    # create user
    @user = User.create(params)
    # log the user in
    session[:user_id] = @user.id
    # redirect to user profile
    redirect "/users/#{@user.id}"
  end

  #users show page
  get '/users/:id' do
    # find user using id
    @user = User.find(params[:id])
    # render our show page
    erb :'/users/show'
  end


  #logs out user by clearing session hash
  get '/logout' do
    #binding.pry
    session.clear
    #binding.pry
    redirect '/'
  end


end
