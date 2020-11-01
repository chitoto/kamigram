class Picture < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_user, through: :favorites, source: :user
end
