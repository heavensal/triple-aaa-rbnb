class AddAddressToCelebrities < ActiveRecord::Migration[7.0]
  def change
    add_column :celebrities, :address, :string
  end
end
