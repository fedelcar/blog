class ArticlesController < ApplicationController
  before_action :verify_authenticity_token
  def index
    @articles = Article.all.page(params[:page]).per(3)
    respond_to do |format|
      format.js
      format.html
    end
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
    @article = Article.new
    @article.title = params[:article][:title]
    @article.text = params[:article][:text]
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    article
    authorize article
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to edit_article_path(@article.id)
    end
  end

  def destroy
    authorize article
    article.destroy
    redirect_to articles_path
  end

  def article
    @article ||= Article.find(params[:id])
  end

  private

  def article_params
    params.permit(:article, :title, :text, :user, :post_title, :id)
  end
end
