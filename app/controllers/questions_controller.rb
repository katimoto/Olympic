class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @questions = Question.includes(:user).page(params[:page]).per(3).order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to root_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path
  end

  def show
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
  end

  def search
    @questions = SearchQuestionsService.search(params[:keyword])
  end

  private
  def question_params
    params.require(:question).permit(:title, :image, :text, :category_id).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
