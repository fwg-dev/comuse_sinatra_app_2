class PostsController < ApplicationController

  # index route for all posts
  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  # get posts/new to render form to create post
  get '/posts/new' do
    if logged_in?
      erb :'/posts/new'
    else
      flash[:error] = "You must be logged in to create a post!"
      redirect '/'
    end
  end

  # post route to create a new post
  post '/posts' do
    @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    # user_id: session[:user_id] works too

    if @post.save
      # if in this block, there are valid inputs
      flash[:message] = "Post successfully created!"
      # redirect to post show page
      redirect "/posts/#{@post.id}"
    else
      # if in this block, some invalid inputs
      flash[:error] = "Post creation failure: #{@post.errors.full_messages.to_sentence}"
      redirect '/posts/new'
    end
  end

  # show route for single post
  get '/posts/:id' do
    # this is a dynamic route - the id is in the params
    @post = Post.find(params[:id])
    erb :'/posts/show'
  end

  # UPDATE
  # link to edit on show page for post
  # get posts/:id/edit to render form to edit a post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    if authorized_to_edit?(@post)
      erb :'/posts/edit'
    else 
      flash[:error] = "Not authorized to edit that post."
      redirect '/posts'
    end
  end

  # patch route to update a existing post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
    redirect "/posts/#{@post.id}"
  end

  # DELETE
  # delete rotue to delete and existing post
  delete '/posts/:id' do
    # we need the id to FIND the post to delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end

end
