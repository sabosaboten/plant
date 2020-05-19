class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
    # if @like.destroy
    #   flash[:success] = "いいね解除しました"
    #   redirect_to post_path(params[:id])
    # end
  end
end
