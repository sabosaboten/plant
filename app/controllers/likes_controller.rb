class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(post_id: params[:post_id])
    if @like.save
      flash[:success] = "いいね登録しました"
      # 以下が動作しない
      redirect_to post_path(params[:id])
  end
end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @like.destroy
      flash[:success] = "いいね解除しました"
      redirect_to post_path(params[:id])
    end
  end
end
