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
    UserMailer.last_10_email(current_user.email,@articles).deliver_now
    redirect_to root_path
  end

  def send_last_10_by_last_5
    HardWorker.perform_async(current_user.email)

    redirect_to root_path
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
      if article.user=current_user.email
        redirect_to @article
      end
    else
      render 'edit'
    end
  end

  def destroy
    if article.user=current_user.email
      article.destroy
    end
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
