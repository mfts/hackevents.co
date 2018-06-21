class Hackathon < ApplicationRecord
  # extend FriendlyId
  # friendly_id :uniqueslug, use: :slugged
  include AlgoliaSearch

  has_many :memberships
  has_many :users, :through => :memberships, dependent: :destroy

  has_many :categorizations
  has_many :categories, :through => :categorizations, dependent: :destroy

  has_many :organizations, foreign_key: "organized_hackathon_id"
  has_many :organizers, :through => :organizations, foreign_key: "organizer_id", dependent: :destroy

  has_many :sponsorships
  has_many :sponsors, :through => :sponsorships, dependent: :destroy

  has_many :events

  accepts_nested_attributes_for :events, 
            :allow_destroy => true,
            :reject_if => lambda { |a| a[:name].blank? }

  belongs_to :city, optional: true
  
  before_save :update_days_mask, :migrate_to_city_id_and_count
  
  scope :with_days, lambda { |days| where("(days_mask & ?) > 0", days.map { |d| 2**DAYS.index(d) }.sum) }
  
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  
  algoliasearch per_environment: :true do
    attribute :title, :city_string
    attribute :city_string_slug do
      self.city_string.parameterize.downcase
    end
    attribute :country_slug do
      self.country.parameterize.downcase
    end
    attribute :nice_slug do
      self.nice_slug
    end
    attribute :date_start_unix do
      self.date_start.to_i
    end
    attributesToIndex ['title','city_string']
  end

  def uniqueslug
    "#{country} #{city_string} #{title}"
  end

  def nice_slug
    "#{id}-#{title}".parameterize.downcase
  end
  
  # FIXME: check if needed
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Hackathon.create! row.to_hash
    end
  end
  
  def update_days_mask
    self.days_mask = possible_days.map { |d| 2**DAYS.index(d) }.sum
  end
  
  def possible_days
    ((date_start.to_date)..(date_start.to_date)).to_a.map do |t|
      t.strftime("%A")
    end.uniq
  end

  def migrate_to_city_id_and_count
    self.city = City.where(name:self.city_string).first_or_create
  end

  def top_cities
    hackathons = Hackathon.where("date_start >= ?", Time.now).group_by { |h| h.city }
  end

  def self.find_in_region(region)
    list = ISO3166::Country.find_all_countries_by_region(region)
    countries = Hackathon.where('date_start >= ?', Time.now).pluck(:country) & list.map(&:name)
    hackathons = Hackathon.where('date_start >= ?', Time.now)
    hackathons = hackathons.where(country: countries)
    hackathons
  end

  def self.find_in_except_region(region)
    list = ISO3166::Country.find_all_countries_by_region(region)
    all_countries = Hackathon.where('date_start >= ?', Time.now).pluck(:country) & list.map(&:name)
    countries = Hackathon.where('date_start >= ?', Time.now).pluck(:country) - all_countries - ["USA"]
    if countries.empty?
      hackathons = Hackathon.where('date_start >= ?', Time.now)
    else
      hackathons = Hackathon.where('date_start >= ?', Time.now)
      hackathons = hackathons.where(country: countries)
    end
    hackathons
  end
  
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query

    where("title like :q or country like :q or city_string like :q ", q: "%#{query}%")
  end
end
