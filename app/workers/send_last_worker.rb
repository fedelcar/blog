class SendLastWorker
  include Sidekiq::Worker

  def perform(user_email, article_number)
    @articles = Article.last(article_number)
    UserMailer.last_10_email(user_email, @articles).deliver
  end
end
