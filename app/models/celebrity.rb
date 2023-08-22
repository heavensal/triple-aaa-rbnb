class Celebrity < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_many_attached :photos
  
  validates :name, presence: true
  # validates :rating, inclusion: { in: 0..5 }
  validates :price, numericality: true
end
