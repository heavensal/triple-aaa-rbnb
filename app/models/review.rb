class Review < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  validates :rating, inclusion: { in: 0..5 }
  validates :comment, presence: true
end
