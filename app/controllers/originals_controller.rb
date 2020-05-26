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


  private
  def original_params
    params.require(:original).permit(:image, :plantname).merge(user_id: current_user.id)
  end

end
