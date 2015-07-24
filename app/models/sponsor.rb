class Sponsor < ActiveRecord::Base
  has_many :sponsorships
  has_many :hackathons, :through => :sponsorships
end
