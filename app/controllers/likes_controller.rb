class LikesController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    # こう記述することで、「current_userに関連したlikeクラスの新しいインスタンス」が作成可能。
    # つまり、like.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    @like = current_user.likes.build(question_id: params[:question_id])
    @like.save
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    @like.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end
end
