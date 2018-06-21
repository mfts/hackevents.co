class Category < ApplicationRecord
  has_many :categorizations
  has_many :hackathons, :through => :categorizations

  has_many :interests
  has_many :users, :through => :interest, dependent: :destroy
  
  def primary_hex_color
    self.primary_color.to_s(16).rjust(6, "0")
  end
  
  def primary_hex_color=(value)
    self.primary_color = value.to_i(16)
  end
end
