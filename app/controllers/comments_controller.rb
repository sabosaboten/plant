class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    redirect_to post_path(params[:post_id])  
  end

  def destroy
    comment = Comment.find(params[:id]) 
    comment.destroy
    redirect_to post_path(params[:post_id])  
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :user_id, :post_id).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end