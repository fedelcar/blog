# rubocop:disable all
class V1::ArticlesController < V1::BaseController
# rubocop:enable all
  def update
    @article ||= Article.find(params[:id])
    @article.title = params[:post_title]
    @article.text = params[:text]
    if @article.save
      render json: {}, status: 200
    else
      render json: {}, status: 400
    end
  end

  def index
    @articles = Article.page(params[:page]).per(3)
    respond_to do |format|
      format.html { render partial: '/articles/articles.html.slim', status: 200 }
      format.json { render json: @articles }
    end
  end

  def article_params
    params.permit(:article, :title, :text, :user, :post_title, :id)
  end
end
