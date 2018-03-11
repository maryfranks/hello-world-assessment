class RepliesController < ApplicationController

  def create
    @reply = Reply.new
    @post = Post.find(params[:post_id])
    @reply.user_id = current_user.id 
    @reply.reply = params[:reply][:reply]
    @reply.post_id = @post.id

    if @reply.save
      redirect_to posts_path
      flash[:notice] = "reply posted"
    else
      flash[:error] = "problem with your reply"
    end



  end

end
