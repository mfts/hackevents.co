class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILGUN_SMTP_LOGIN_T"]
  layout 'mailer'
end
