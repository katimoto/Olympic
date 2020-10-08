class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
    query = "SELECT * FROM articles"
    @articles = Article.find_by_sql(query)
    @questions = Question.includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to root_path
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render root_path
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end

  def show
    @favorite = Favorite.new
    @favorites = @article.favorites.includes(:user)
  end

  def search
    @articles = SearchArticlesService.search(params[:keyword])
  end

  private
  def article_params
    params.require(:article).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
