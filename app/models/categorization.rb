class Categorization < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :category
end
