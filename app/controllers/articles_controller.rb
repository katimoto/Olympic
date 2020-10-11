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
    @article = ArticlesTag.new
  end

  def create
    @article = ArticlesTag.new(article_params)
    if @article.valid?
      @article.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end

  def show
    @users = User.all
    @favorite = Favorite.new
    @favorites = @article.favorites.includes(:user)
  end

  def search
    @articles = SearchArticlesService.search(params[:keyword])
  end

  def tagsearch
    return nil if params[:input] == ""
    tag = Tag.where(['word LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  private
  def article_params
    params.require(:articles_tag).permit(:image, :text, :word).merge(user_id: current_user.id)
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
