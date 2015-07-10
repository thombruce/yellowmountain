class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_form.subject
  #
  def contact_form(email)
    @email = email

    mail to: "support@yellowmountain.io", from: "#{email.name} <#{email.email}>", subject: 'YM Contact | ' + email.subject
  end
end
