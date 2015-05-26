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
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    article
    if @article.user == current_user
      @article.update(article_params) 
      redirect_to articles_path
    else
      redirect_to edit_article_path(@article.id) 
    end
  end

  def destroy
    article.destroy if article.user == current_user
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
