class City < ActiveRecord::Base
  has_many :hackathons

  geocoded_by :ip_address
  after_validation :geocode
  
  def hackathon_in_city(city)
    Hackathon.where('city_id = ? AND date_start >= ?', city, Time.now).order(:date_start)
  end
  # FIX ME - delete this afterwards
  def to_s
    self.name
  end

  def to_param
    name.parameterize.downcase
  end
end
