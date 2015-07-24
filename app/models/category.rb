class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :hackathons, :through => :categorizations

end
