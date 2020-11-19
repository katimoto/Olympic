class RoomsController < ApplicationController
  before_action :move_to_login, except: [:index, :show]
  before_action :find_room, only: [:edit, :update, :order]
  before_action :search_room, only: [:index, :search]

  def index
    @rooms = Room.includes(:user).page(params[:page]).per(20).order('created_at DESC')
    set_room_column
  end

  def new
    redirect_to new_card_path and return unless current_user.card.present?
    @room = Room.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?

    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @room = current_user.rooms
    # @messages = @room.messages.includes(:user)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to room_path(current_user)
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @room.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

    order = RoomOrder.new(room_id: params[:id], user_id: current_user.id) # 商品のid情報を「room_id」として保存する
    if order.save
      roomuser = Room.find(params[:id]).user_id
      RoomUser.create(room_id: params[:id], user_id: current_user.id)
      RoomUser.create(room_id: params[:id], user_id: roomuser)
    end
    redirect_to room_path(current_user)
  end

  def order_new
    @room = Room.find(params[:id])
  end
  
  def order_edit
  end

  def order_update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to rooms_path
  end
    
  def search
    @results = @p.result.includes(:user) # 検索条件にマッチした商品の情報を取得
    set_room_column
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def room_params
    params.require(:room).permit(:name, :price, :text, :category_id, :user_id, :image)
  end

  def find_room
    @room = Room.find(params[:id]) # 購入する商品を特定
  end

  def search_room
    @p = Room.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_room_column
    @room_name = Room.select('name').distinct  # 重複なくnameカラムのデータを取り出す
    @room_category = Room.select('category_id').distinct
  end
end
