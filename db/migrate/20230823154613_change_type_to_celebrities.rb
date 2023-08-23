class ChangeTypeToCelebrities < ActiveRecord::Migration[7.0]
  def change
    change_table(:celebrities) do |t|
      t.change :rating, :float
    end
  end
end
