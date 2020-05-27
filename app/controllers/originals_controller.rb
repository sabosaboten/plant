class OriginalsController < ApplicationController
  def create
    @original=Original.create(original_params)
    if @original.save
      redirect_to posts_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    original = Original.find(params[:id])
    original.destroy
    redirect_back(fallback_location: root_path) 
  end

  def edit
    @original = Original.find(params[:id])
  end

  def update
    original = Original.find(params[:id])
    original.update(post_params)
    redirect_to events_path
  end

  private
  def original_params
    params.require(:original).permit(:image, :plantname).merge(user_id: current_user.id)
  end

end
