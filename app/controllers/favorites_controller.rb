class FavoritesController < ApplicationController
	before_action :authenticate_user!

  def create
  	@post = Post.find(params[:post_id])
  	@favorite = current_user.favorites.build(post: @post)
  	if @favorite.save
  		redirect_back(fallback_location: root_path, notice: "お気に入りしました")
  	else
  		redirect_to posts_url, alart: "この投稿はお気に入りできませんでした"
  	end
  end

  def destroy
  	@favorite = current_user.favorites.find_by!(post_id: params[:post_id])

  	@favorite.destroy
  	redirect_back(fallback_location: root_path, notice: "お気に入りを解除しました")
  end

  def index
    @posts = Post.all
  end
end
