class Board < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: ["Snowboard", "Skateboard", "Surfboard"] }

end
