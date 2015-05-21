class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    article
  end

  def new
    @article = Article.new
  end

  def send_last_10
    redirect_to root_path
  end

  def edit
    article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
   article

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article    @article.destroy

    redirect_to articles_path
  end

  def article
   @article ||=Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
