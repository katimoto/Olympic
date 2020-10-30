class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # 投稿に紐づいたコメントを作成
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.permit(:article_id).merge(user_id: current_user.id, text: params[:comment][:text])
  end
end
