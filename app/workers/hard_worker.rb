class HardWorker
  include Sidekiq::Worker

  def perform(user)
    @articles = []
    User.last(10).each do |u|
      @articles_by_user = Article.where('articles.user=?', u.email).last(10)
      @articles_by_user.each do |a|
        @articles.push(a)
      end
    end
    UserMailer.last_10_email(user, @articles).deliver_now
  end
end
