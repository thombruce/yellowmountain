class ContactController < ApplicationController
  def create
    @email = Email.new(contact_params)
    ContactMailer.contact_form(@email).deliver_now
    redirect_to root_path
  end
  protected
  def contact_params
    params.require(:email).permit(:name, :email, :subject, :message)
  end
end
