class Post < ApplicationRecord

  belongs_to :user
  has_many   :replies
  
  validates :text, :city, presence: true
end
