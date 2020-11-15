class AnswersController < ApplicationController
  def show 
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    # 投稿に紐づいたコメントを作成
    @answer = @question.answers.build(answer_params)
    @answer.save
    render :index
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render :index
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, question_id: @question.id)
  end
end
