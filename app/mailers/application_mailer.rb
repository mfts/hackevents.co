class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILGUN_SMTP_LOGIN"]
  layout 'mailer'
end
