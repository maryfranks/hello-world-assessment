class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.text = params[:post][:text]
    @post.user_id = params[:post][:user_id]
    if @post.save
      redirect_to posts_path
      flash[:notice] = "Post Created"
    else
      flash[:error] = "Oops, try again - Posts must have text!"
    end

  end

end
