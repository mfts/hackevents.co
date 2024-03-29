class UserMailer < ApplicationMailer
  default from: "Hackevents <dev@hackevents.co>"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", 
         :subject => "Registration Confirmation")
  end
end
