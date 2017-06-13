class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user,only:[:edit,:update]
  before_action :set_user,only: [:show]
  
  def show
    @posts = @user.posts.order(updated_at: :desc)
    @post = Post.new
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @post = Post.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user),notice: 'Updated your information!' 
    else
      render :edit,notice: 'Failed to update, sorry.' 
    end

    def favorites
      @user = User.find(params[:id])
    end
  end

  def follows
    @user = User.find(params:[id])
    @follows = @user.followings
  end

  def followers
    @user = User.find(paarams[:id])
    @followers = @user.followers
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
       params.require(:user).permit(:name, :introduction,:image)
    end

   def check_correct_user
      set_user
      if !correct_user?(@user)
        render :show
      end
    end
end