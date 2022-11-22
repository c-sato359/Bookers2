class Book < ApplicationRecord
  has_one_attached :text
  
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end
