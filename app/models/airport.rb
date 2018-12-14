class Airport < ApplicationRecord
  has_many :airport_users
  has_many :users, :through => :airport_users
end
