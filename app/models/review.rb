class Review < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  validates :rating, inclusion: { in: 0..5 }
  validates :comment, length: { maximum: 50,
    message: "Vous avez depassé le nombre de caractères autorisés" }
end
