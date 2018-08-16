class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :boards
  has_many :rented_things, through: :bookings, source: :board
  has_many :owned_things, class_name: "Board" # now instead of 1:N .things you get .owned_things
end
