class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :show]
  before_action :search_question, only: [:index, :search]

  def index
    @questions = Question.includes(:user).page(params[:page]).per(8).order("created_at DESC")
    set_question_column
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  def edit
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question.id)
  end

  def show
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
    @reaction = Reaction.new
  end

  # def search
  #   @questions = SearchQuestionsService.search(params[:keyword]).page(params[:page]).per(8).order("created_at DESC")
  # end

  def search
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
    @questions = SearchQuestionsService.search(params[:keyword]).page(params[:page]).per(8).order("created_at DESC")
    set_question_column
  end

  private
  def question_params
    params.require(:question).permit(:title, :image, :text, :category_id, :best_answer_id).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def search_question
    @p = Question.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_question_column
    @question_created = Question.select("created_at").distinct  # 重複なくnameカラムのデータを取り出す
    @question_category = Question.select("category_id").distinct
  end
end
