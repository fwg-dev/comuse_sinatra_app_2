class PostsController < ApplicationController

  # index route for all posts
  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  # get posts/new to render form to create post
  get '/posts/new' do
    erb :'/posts/new'
  end

  # post route to create a new post
  post '/posts' do
    # create the post
    @post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    # user_id: session[:user_id] works too

    # redirect to post show page
    redirect "/posts/#{@post.id}"
  end

  # show route for single post
  get '/posts/:id' do
    # this is a dynamic route - the id is in the params
    @post = Post.find(params[:id])
    erb :'/posts/show'
  end

  # get posts/:id/edit to render form to edit a post

  # patch route to update an exsisting post
    # find that post
    # .update on that post using params
    # redirect to the show page

  # delete route to delete an exsisting post
    #redirect to all posts page

end
