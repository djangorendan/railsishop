class UserMailer < ApplicationMailer
  default from: 'ninjarendan@google.com'

  def welcome_mail
    @user = params[:user]
    @password = params[:password]
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Добро пожаловать на Angar.kh.ua')
  end
end
