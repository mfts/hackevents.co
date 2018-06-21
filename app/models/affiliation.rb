class Affiliation < ApplicationRecord
  belongs_to :sponsor
  belongs_to :user
end
