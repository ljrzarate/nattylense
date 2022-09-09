class UserMailer < ActionMailer::Base
  default :from => "me@mydomain.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => @user.email, subject: "Registration Confirmation")
  end

  def password_reset(user)
    @user = user
    mail(:to => @user.email, subject: "Password Reset")
  end
end