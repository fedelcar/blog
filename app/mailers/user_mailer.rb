class UserMailer < ApplicationMailer
  default from: "federico.lopez@wolox.com.ar"
 
  def last_10_email(user, articles)
    @user = user
    @articles = articles
    mail(to: @user.email, subject: "Welcome to Puppify!")
  end
end
 