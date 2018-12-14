class AirportUser < ApplicationRecord
  belongs_to :user
  belongs_to :airport
end
