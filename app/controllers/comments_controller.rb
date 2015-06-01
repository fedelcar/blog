class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    article
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    article
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def article
    @article ||= Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
