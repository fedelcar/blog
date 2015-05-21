class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def destroy?
    @user.email == @article.user
  end

  def update?
    @user.email == @article.user
  end
end
