class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reserve_users, through: :reservations, source: :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
