class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_form.subject
  #
  def contact_form
    @greeting = "You have a new query"

    mail to: "thom@yellowmountain.io"
  end
end
