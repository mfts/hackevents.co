class Hackathon < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  has_many :memberships
  has_many :users, :through => :memberships, dependent: :destroy

  has_many :categorizations
  has_many :categories, :through => :categorizations, dependent: :destroy

  has_many :sponsorships
  has_many :sponsors, :through => :sponsorships, dependent: :destroy

  belongs_to :city
  
  before_save :update_days_mask
  
  scope :with_days, lambda { |days| where("(days_mask & ?) > 0", days.map { |d| 2**DAYS.index(d) }.sum) }
  
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  
  searchable do
    text :title, :venue, :city, :address, :country, :month_start
    time :date_start
  end

  def month_start
    date_start.strftime("%B %Y")
  end

  def uniqueslug
    "#{country} #{city} #{title}"
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

  def top_cities
    hackathons = Hackathon.where("date_start >= ?", Time.now).group_by { |h| h.city }
  end
  
  # # It returns the articles whose titles contain one or more words that form the query
  # def self.search(query)
  #   # where(:title, query) -> This would return an exact match of the query

  #   where("title like :q or country like :q or city_string like :q ", q: "%#{query}%")
  # end
end
