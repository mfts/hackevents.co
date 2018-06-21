class Sponsorship < ApplicationRecord
  belongs_to :sponsor
  belongs_to :hackathon
end
