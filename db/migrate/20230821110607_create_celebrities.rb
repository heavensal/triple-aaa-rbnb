class CreateCelebrities < ActiveRecord::Migration[7.0]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.integer :rating
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
