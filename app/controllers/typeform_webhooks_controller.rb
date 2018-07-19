class TypeformWebhooksController < ActionController::Base
  before_action :validate_code, only: [:create]

  def create
    tf = params[:form_response][:answers]
    title       = tf[tf.index(tf.find {|x| x[:field][:id] == "36088916"})]["text"]
    url         = tf[tf.index(tf.find {|x| x[:field][:id] == "36089418"})]["url"]
    date_start  = tf[tf.index(tf.find {|x| x[:field][:id] == "dGjmNmVn98tY"})]["date"]
    date_end    = tf[tf.index(tf.find {|x| x[:field][:id] == "D62aQf5toFOA"})]["date"]
    country     = tf[tf.index(tf.find {|x| x[:field][:id] == "36089547"})]["choice"]["label"]
    city_string = tf[tf.index(tf.find {|x| x[:field][:id] == "36089130"})]["text"]
    address     = tf[tf.index(tf.find {|x| x[:field][:id] == "36089283"})]["text"]
    image_url   = tf[tf.index(tf.find {|x| x[:field][:id] == "36092704"})]["file_url"]
    email       = tf[tf.index(tf.find {|x| x[:field][:id] == "36098474"})]["email"]


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