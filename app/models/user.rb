class User < ApplicationRecord
  has_secure_password
  has_many :airport_users
  has_many :airports, :through => :airport_users
  has_many :avails

  validates :firstName, :lastName, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/ }
  # before we uncomment this, make sure we're removing non-number characters from phone number on client side
  # validates :phone, format: { with: /\A\d*\z/ }, length: { is: 10 } should it be optional?
end
