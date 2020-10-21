class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    #投稿に紐づいたコメントを作成
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    @answer.save
    redirect_to question_path(@question.id)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render :index
  end

  private
  def answer_params
    params.permit(:question_id).merge(user_id: current_user.id, text: params[:answer][:text])
  end
end

