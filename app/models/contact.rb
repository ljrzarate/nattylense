class Contact < ApplicationRecord

  after_create :deliver_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: Devise::email_regexp
  validates :subject, presence: true
  validates :message, presence: true

  def deliver_email
    ContactMailer.new_contact(self).deliver
  end
end
