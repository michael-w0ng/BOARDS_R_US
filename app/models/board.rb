class Board < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: ["Snowboard", "Skateboard", "Surfboard"] }

end
