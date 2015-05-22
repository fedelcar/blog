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
    @articles = Article.last(10)
    UserMailer.last_10_email(current_user.email, @articles).deliver_now
    redirect_to root_path
  end

  def send_last_10_by_last_5
    # def get_content_to_display
    HardWorker.perform_async(current_user.email)
    render :processing_email do |page|
      page.replace_html 'display_ajax', partial: '_processed'
    end
  end

  def edit
    article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user.email
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    article
    if @article.update(article_params)
      redirect_to @article if article.user = current_user.email
    else
      render 'edit'
    end
  end

  def destroy
    article.destroy if article.user = current_user.email
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
