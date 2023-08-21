class Celebrity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :rating, inclusion: { in: 0..5 }
  validates :prices, numericality: true
end
