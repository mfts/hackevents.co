class TypeformHackathonMailer < ApplicationMailer
  default from: "Hackevents <info@hackevents.co>"
  
  def submission_success(email,hackathon)
    @email = email
    @hackathon = hackathon
    mail(:to => "<marcftone@gmail.com>", 
         :subject => "New Typeform Submission Success")
  end

  def submission_error(email, title, url)
    @email = email
    @title = title
    @url = url
    mail(:to => "<marcftone@gmail.com>", 
      :subject => "New Typeform Submission Error")
  end
end