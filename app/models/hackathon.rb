def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Hackathon.create! row.to_hash
  end
end

class Hackathon < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  has_many :memberships
  has_many :users, :through => :memberships, dependent: :destroy

  def uniqueslug
    "#{country} #{city} #{title}"
  end

  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query

    where("title like :q or country like :q or city like :q ", q: "%#{query}%")
  end
end
