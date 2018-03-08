class SessionsController < ApplicationController

  def new
    @user = User.new
    @user.save
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "Logged in!"
    else
      render root_path
    end
  end

  def destroy
   session[:redirect] = nil
   @current_user = session[:user_id] = nil
   flash[:notice] = "You have successfully logged out."
   redirect_to root_path
   end

end
