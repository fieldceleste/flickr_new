class Comment < ActiveRecord::Basic
  belongs_to :photo
  validates :content, presence: true
end
