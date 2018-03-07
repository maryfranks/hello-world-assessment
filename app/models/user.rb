require 'bcrypt'

class User < ApplicationRecord

  has_secure_password

  has_many :posts

  validates :username, uniqueness: true
  validates :username, :password_digest, presence: true

end
