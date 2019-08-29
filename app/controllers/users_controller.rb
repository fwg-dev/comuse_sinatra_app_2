class UsersController < ApplicationController

  # initial login route
  get '/login' do
    # render login form
    erb :'/users/login'
  end

end
