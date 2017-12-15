class UserMailer < ApplicationMailer

  default from: 'notifications@RubyBlog.com'

  def welcome_email
    @user = User.find(params[:user])
    @url  = session_login_path
    mail(to: @user.email, subject: 'Регистрация на сайте')
  end


  def add_answers
    @user = User.find(params[:user])
    @question = Question.find(params[:question])
    @url  = question_path(@question)
    mail(to: @user.email, subject: 'Новый ответ на вопрос')
  end
end
