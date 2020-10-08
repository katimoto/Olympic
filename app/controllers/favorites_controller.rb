class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(favorite_params)
    redirect_to "/articles/#{favorite.article.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def favorite_params
    params.require(:favorite).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end

# .permit(:text)