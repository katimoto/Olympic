class ArticlesController < ApplicationController
  before_action :move_to_login, except: [:index, :show, :search, :news]
  before_action :set_article, only: [:edit, :show]
  before_action :search_article, only: [:index, :searches]

  def news
  end
  
  def index
    @articles = Article.includes(:user).page(params[:page]).per(6).order("created_at DESC")
    @questions = Question.includes(:user).page(params[:page]).per(10).order("created_at DESC")
    set_article_column 
  end

  def new
    @article = ArticlesTag.new
  end

  def create
    @article = ArticlesTag.new(article_params)
    if @article.valid?
      @article.save
      return redirect_to articles_path
    else
      render "new"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  def edit
    tag
    @articles_tag = ArticlesTag.new(title: @article.title, text: @article.text, image: @article.image, word: @tag.word )
  end

  def update
    @articles_tag = ArticlesTag.new(article_params)
    if @articles_tag.update(params[:id])
      redirect_to articles_path 
    else
      render :edit
    end 
  end

  def show
    @users = User.all
    @favorite = Favorite.new
    @favorites = @article.favorites.includes(:user)
    @comment = Comment.new
    @comments = @article.comments.includes(:user).order(created_at: :desc)
  end

  def search
    @articles = SearchArticlesService.search(params[:keyword]).page(params[:page]).per(6).order("created_at DESC")
    article_favorite_count = Article.joins(:favorites).group(:article_id).count
    article_favorited_ids = Hash[article_favorite_count.sort_by{ |_, v| -v }].keys
    @article_ranking = Article.where(id: article_favorited_ids)
  end

  def tagsearch
    return nil if params[:input] == ""
    tag = Tag.where(['word favoritE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  def searches
    @results = @p.result.includes(:articles)  # 検索条件にマッチした商品の情報を取得
    set_article_column
  end

  private
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def article_params
    params.require(:articles_tag).permit(:title, :image, :text, :word).merge(user_id: current_user.id)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

  def tag
    set_article
    @article.tags.each do |tag|
      @tag = tag
    end
  end  

  def search_article
    @p = Tag.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_article_column
    @article_tag = Tag.select("word").distinct  # 重複なくnameカラムのデータを取り出す
  end
end
