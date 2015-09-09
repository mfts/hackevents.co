class City < ActiveRecord::Base
  has_many :hackathons

  def hackathon_in_city(city)
    Hackathon.where('city_id = ? AND date_start >= ?', city, Time.now).order(:date_start)
  end
  # FIX ME - delete this afterwards
  def to_s
    self.name
  end

  def to_param
    name.downcase
  end
end
