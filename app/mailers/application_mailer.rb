class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: "thom@yellowmountain.io"
  layout 'mailer'
end
