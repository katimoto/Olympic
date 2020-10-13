class FavoritesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_articles = @user.favorite_articles
  end

  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    redirect_to articles_path
  end

  def destroy
    favorite = Favorite.find_by(article_id: params[:article_id], user_id: current_user.id)
    favorite.destroy
    redirect_to articles_path
  end
end

# .permit(:text)