class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def article
    @user = User.find(params[:id])
    @name = @user.name
    @articles = @user.articles.page(params[:page]).per(6).order('created_at DESC')
  end

  def question
    @user = User.find(params[:id])
    @name = @user.name
    @questions = @user.questions.page(params[:page]).per(8).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @articles = @user.articles.page(params[:page]).per(6).order('created_at DESC')
    @favorite_articles = @user.favorite_articles.page(params[:page]).per(3).order('created_at DESC')
    @questions = @user.questions
    @sport = Category.find_by(id: params[:category_id])

    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # card = Card.find_by(user_id: current_user.id)

    # customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    # @card = customer.cards.first
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
    params.require(:user).permit(:name, :email, :image, :category_id, :career, :introduce)
  end
end
