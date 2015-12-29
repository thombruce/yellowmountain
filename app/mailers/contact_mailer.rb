class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_form.subject
  #
  def contact_form(email)
    @email = email

    if Rails.env.development?
      mail_to = ENV["EMAIL"]
    else
      mail_to = "thom@thombruce.com"
    end

    mail to: mail_to, from: "#{email.name} <#{email.email}>", subject: 'YM Contact | ' + email.subject
  end
end
