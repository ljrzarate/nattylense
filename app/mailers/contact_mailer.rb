class ContactMailer < ActionMailer::Base


  def new_contact(contact)
    @contact = contact
    mail(:to => "you@fuckingbrandme.com", subject: @contact.subject)
  end

end