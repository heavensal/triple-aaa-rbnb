class AddUserRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, null: false, foreign_key: true
    add_reference :reviews, :celebrity, null: false, foreign_key: true
  end
end
