class UserMailer < ApplicationMailer

  default from: 'notifications@RubyBlog.com'

  def welcome_email
    @user = User.find(params[:user])
    @url  = registration_url
    mail(to: @user.email, subject: 'Регистрация на сайте')
  end

end
