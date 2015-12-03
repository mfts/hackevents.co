class SuggestedOrganizerMailer < ApplicationMailer
  default from: "Hackevents <dev@hackevents.co>"
  
  def suggestions(user,hackathon,input)
    @user = user
    @hackathon = hackathon
    @input = input
    mail(:to => "dev@hackevents.co, michael@hackevents.co", 
         :subject => "New Suggested Organizer")
  end
end
