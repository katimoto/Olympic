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
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @articles = @user.articles
    @favorite_articles = @user.favorite_articles
    @questions = @user.questions

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
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
    params.require(:user).permit(:name, :email, :image)
  end
end
