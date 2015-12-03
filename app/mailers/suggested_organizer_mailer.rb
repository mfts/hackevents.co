class SuggestedOrganizerMailer < ApplicationMailer
  default from: "Hackevents <info@hackevents.co>"
  
  def suggestions(user,hackathon,input)
    @user = user
    @hackathon = hackathon
    @input = input
    mail(:to => "<michael_strobl@gmx.de>, <marcftone@gmail.com>", 
         :subject => "New Suggested Organizer")
  end
end
