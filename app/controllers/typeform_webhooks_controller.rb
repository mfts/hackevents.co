class TypeformWebhooksController < ActionController::Base
  before_action :validate_code, only: [:create]

  def create
    tf = params[:form_response][:answers]
    title       = tf[0]["text"]             if tf[0][:field][:id] == "36088916"
    url         = tf[1]["url"]              if tf[1][:field][:id] == "36089418"
    date_start  = tf[2]["date"]             if tf[2][:field][:id] == "dGjmNmVn98tY"
    date_end    = tf[3]["date"]             if tf[3][:field][:id] == "D62aQf5toFOA"
    country     = tf[6]["choice"]["label"]  if tf[6][:field][:id] == "36089547"
    city_string = tf[8]["text"]             if tf[8][:field][:id] == "36089130"
    address     = tf[9]["text"]             if tf[9][:field][:id] == "36089283"
    image_url   = tf[10]["file_url"]        if tf[10][:field][:id] == "36092704"
    email       = tf[12]["email"]           if tf[12][:field][:id] == "36098474"

    @hackathon = Hackathon.new(
      title: title,
      country: country,
      city_string: city_string,
      url: url,
      date_start: date_start.to_datetime, 
      date_end: date_end.to_datetime,
      address: address,
      image_url: image_url
    )

    if @hackathon.save
      TypeformHackathonMailer.submission_success(email,@hackathon).deliver
    else
      TypeformHackathonMailer.submission_error(email,title,url).deliver
    end
  end

  private
  def validate_code
    if params[:form_response][:form_id] === "yx3OeS" && params[:form_response][:token] === "4969bac7b56e83a82ad060f0ae57faed"
      true
    end
  end
end