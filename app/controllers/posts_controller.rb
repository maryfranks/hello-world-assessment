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
    @post.city = params[:post][:city]
    @post.user_id = current_user.id
    @post.lat = params[:post][:lat]
    @post.long = params[:post][:long]
    @post.weather = params[:post][:weather]
    if @post.save
      redirect_to posts_path
      flash[:notice] = "Post Created"
    else
      flash[:error] = "Oops, try again - Posts must have text and city!"
    end

  end

  def show
    @post = Post.find(params[:id])
  end

end
