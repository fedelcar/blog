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
    SendLastWorker.perform_async(current_user.email, 10)
    redirect_to root_path
  end

  def send_last_10_by_last_5
    HardWorker.perform_async(current_user.email)
    respond_to do |format|
      format.html { render html: 'Email Sent' }
    end
  end

  def edit
    article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    article
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to edit_article_path(@article.id)
    end
  end

  def destroy
    article
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  def article
    @article ||= Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :user)
  end
end
