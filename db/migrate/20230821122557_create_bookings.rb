class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :date_debut
      t.datetime :date_fin
      t.references :celebrity, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
