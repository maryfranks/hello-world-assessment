require 'bcrypt'

class User < ApplicationRecord

  has_secure_password

  has_many :posts
  has_many :replies 

  validates :username, uniqueness: true
  validates :username, :password_digest, presence: true

end
