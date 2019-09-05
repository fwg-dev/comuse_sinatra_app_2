class PostsController < ApplicationController

  # index route for all posts
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  # show route for single post

  # get posts/new to render form to create post

  # post route to create a new post

  # get posts/:id/edit to render form to edit a post

  # patch route to update an exsisting post

  # delete route to delete an exsisting post
    #redirect to all posts page 

end
