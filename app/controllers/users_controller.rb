class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
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
    @user = User.find(params[:id])
    @name = @user.name
    @articles = @user.articles
    @questions = @user.questions
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
