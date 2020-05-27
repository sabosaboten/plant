class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
    @users = User.all
    @likes = user.likes

    @originals = user.originals
    
    @shops = @user.shops
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      # marker.infowindow shop.name
      marker.infowindow render_to_string(partial:"shops/infowindow", locals:{ shop: shop })
    end

    @events = @user.events

  end

  def index

  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

