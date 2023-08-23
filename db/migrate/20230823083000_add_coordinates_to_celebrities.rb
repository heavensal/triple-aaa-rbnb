class AddCoordinatesToCelebrities < ActiveRecord::Migration[7.0]
  def change
    add_column :celebrities, :latitude, :float
    add_column :celebrities, :longitude, :float
  end
end
