# rubocop:disable all
class V1::ArticlesController < V1::BaseController
# rubocop:enable all
  def api_update
    @article ||= Article.find(params[:id])
    @article.title = params[:post_title]
    @article.text = params[:text]
    if @article.save
      render json: {}, status: 200
    else
      render json: {}, status: 400
    end
  end
end
