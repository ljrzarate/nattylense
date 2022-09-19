class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      flash[:notice] = 'Thanks, a member of our team will contact you soon'
      redirect_to new_contact_path
    else
      flash[:alert] = @contact.errors.full_messages.join(', ')
      render new_contact_path
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :message)
  end
end