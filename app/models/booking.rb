class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  validates :date_debut, comparison: { greater_than: :date_fin }
  validates :date_fin, comparison: { less_than: :date_debut }
end
