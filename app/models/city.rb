class City < ActiveRecord::Base

 def hackathon_in_city(city)
    Hackathon.where('city = ? AND date_start >= ?', city, Time.now).order(:date_start)
  end

end
