class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :group_images
  has_many :groups, through: :group_images
  has_many :comments

  validates :url, presence: true
  validates :gallery, presence: true

end
