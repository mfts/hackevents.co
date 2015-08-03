class Sponsor < ActiveRecord::Base
  has_many :sponsorships
  has_many :hackathons, :through => :sponsorships

  has_many :affiliations
  has_many :users, :through => :affiliations, dependent: :destroy
  
  def name
    [self.alt_name, self.twitter_name, self.twitter_handle].find { |n| n.present? }
  end
end
