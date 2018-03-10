class Post < ApplicationRecord
  belongs_to :user
  has_many   :replies 
  validates :text, presence: true
end
