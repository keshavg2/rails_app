class UserMailer < ApplicationMailer
  default from: 'hello@mydomain.com'

  def welcome_email
    email = params[:email]
    @url  = 'http://localhost:3000/user/login'
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end
end
