class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Logged in!"
    else
      redirect_to new_session_path
      flash[:error] = "Login failed"
    end
  end

  def destroy
   session[:redirect] = nil
   @current_user = session[:user_id] = nil
   flash[:notice] = "You have successfully logged out."
   redirect_to root_url
   end

end
