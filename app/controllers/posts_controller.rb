# class PostsController < ApplicationController
#   def index
#     @posts = Post.all
#   end
  
#   def new
#     @post = Post.new
#   end

#   def create
#     Post.create(post_params)
#     redirect_to posts_path
#   end

#   def edit
#     @post = Post.find(params[:id])
#   end

#   def show
#     @post = Post.find(params[:id])
#   end

#   def update
#     post = Post.find(params[:id])
#     post.update(post_params)
#     redirect_to posts_path
#   end

#   def destroy
#     post = Post.find(params[:id])
#     post.destroy
#     redirect_to posts_path
#   end
    

#   private
#   def post_params
#     params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
#   end
# end

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    # 下追加
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end

end