class City < ActiveRecord::Base
  include AlgoliaSearch
  has_many :hackathons

  # geocoded_by :ip_address
  # after_validation :geocode

  algoliasearch per_environment: :true do
    attribute :name, :hackathon_count
    attribute :slug_name do
      self.to_param
    end
    attributesToIndex ['name']
  end
  
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
