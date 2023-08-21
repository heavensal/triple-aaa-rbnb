class Booking < ApplicationRecord
  belong_to :user
  belong_to :celebrity

  validates :date_debut, comparison: { greater_than: :date_fin }
  validates :date_fin, comparision: { less_than: :date_debut }
end
