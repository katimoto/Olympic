class AnswersController < ApplicationController
  def create
    answer = Answer.create(answer_params)
    redirect_to "/questions/#{answer.question.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
