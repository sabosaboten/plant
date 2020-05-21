class ShopsController < ApplicationController
  def index
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address).merge(user_id: current_user.id)
  end

end
