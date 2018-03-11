class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = 'Account successfully created!'
      redirect_to new_session_path
    else
      flash.now[:error] = 'Sorry, try again!'
      render :new
    end
  end

  def show
    @user = current_user
    @posts = @user.posts
    @post = Post.new
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
