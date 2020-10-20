class FavoritesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def show
    @user = User.find(current_user.id)
    @name = @user.name
    @favorite_articles = @user.favorite_articles.page(params[:page]).per(3).order("created_at DESC")
  end

  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save

  end

  def destroy
    favorite = Favorite.find_by(article_id: params[:article_id], user_id: current_user.id)
    favorite.destroy

  end

  private
  # こちらを記入しないとajaxが上手く起動しませんでした。
  def set_article
    @article = Article.find(params[:article_id])
  end
end