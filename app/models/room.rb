class Room < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
