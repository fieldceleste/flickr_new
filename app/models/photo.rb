class Photo < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  has_many_attached :images
end 