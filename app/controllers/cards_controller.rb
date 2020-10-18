class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )
  
    card = Card.new( # トークン化されたカード情報を保存する
        card_token: params[:card_token], # カードトークン
        customer_token: customer.id, # 顧客トークン
        user_id: current_user.id # ログインしているユーザー
      )
    if card.save
      redirect_to root_path
    else
      redirect_to "new" # カード登録画面
    end
  end

  def show
    redirect_to new_card_path and return unless current_user.card.present?
    
    @user = User.find(current_user.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end
end
