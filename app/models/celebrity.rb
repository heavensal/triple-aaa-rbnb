class Celebrity < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  has_many :reviews
  belongs_to :user

  has_many_attached :photos

  validates :name, presence: true
  # validates :rating, inclusion: { in: 0..5 }
  validates :price, numericality: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
