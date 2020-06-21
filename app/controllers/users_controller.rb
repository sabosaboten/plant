class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new_guest]
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
    @events = @user.events
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      # marker.infowindow shop.name
      marker.infowindow render_to_string(partial:"shops/infowindow", locals:{ shop: shop })
    end
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to homes_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

