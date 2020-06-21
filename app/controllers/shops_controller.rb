class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @shop = Shop.new
    @shops = Shop.all
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      # marker.infowindow shop.name
      marker.infowindow render_to_string(partial:"shops/infowindow", locals:{ shop: shop })
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    redirect_to shops_path
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to shops_path
  end


  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_back(fallback_location: shops_path) 
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude, :text).merge(user_id: current_user.id)
  end

end
