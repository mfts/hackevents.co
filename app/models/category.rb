class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :hackathons, :through => :categorizations
  
  def primary_hex_color
    self.primary_color.to_s(16).rjust(6, "0")
  end
end
