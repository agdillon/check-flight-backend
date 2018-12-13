class User < ApplicationRecord
  validates :firstName, :lastName, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/ }
  # before we uncomment this, make sure we're removing non-number characters from phone number on client side
  # validates :phone, format: { with: /^\d*$/ }, length: { is: 10 } should it be optional?
end
