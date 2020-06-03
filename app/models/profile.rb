class Profile < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many_attached :profile_photos
end