class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @articles = Article.includes(:user).page(params[:page]).per(6).order("created_at DESC")
    @questions = Question.includes(:user).page(params[:page]).per(10).order("created_at DESC")
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
  end

  def search
    @articles = SearchArticlesService.search(params[:keyword]).page(params[:page]).per(6).order("created_at DESC")
  end

  def tagsearch
    return nil if params[:input] == ""
    tag = Tag.where(['word LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  private
  def article_params
    params.require(:articles_tag).permit(:title, :image, :text, :word).merge(user_id: current_user.id)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

  # def tag
  #   set_article
  #   @article.tags.each do |tag|
  #     @tag = tag
  #   end
  # end  

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
