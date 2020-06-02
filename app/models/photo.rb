class Photo < ActiveRecord::Base
  #--add comments
  validates :title, presence: true
  has_one_attached :image
  validates_acceptance_of :image, content_type: /\Aimage\/.*\z/ 
end 