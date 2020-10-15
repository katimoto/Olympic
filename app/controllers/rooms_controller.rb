class RoomsController < ApplicationController
  before_action :find_room, only: :order

  def index
    @rooms = Room.includes(:user).page(params[:page]).per(20).order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?

    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @room.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
      )

    RoomOrder.create(room_id: params[:id]) # 商品のid情報を「room_id」として保存する
    redirect_to root_path
  end

  def order_new
    @room = Room.find(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:name, :price, :text, :category_id, user_ids:[])
  end

  def find_room
    @room = Room.find(params[:id]) # 購入する商品を特定
  end
end
