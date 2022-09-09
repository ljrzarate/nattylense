class User < ApplicationRecord
  after_create :send_confirmation_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  def send_confirmation_mail
    UserMailer.registration_confirmation(self).deliver
  end
end
