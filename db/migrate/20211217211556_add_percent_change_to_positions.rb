class AddPercentChangeToPositions < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :percent_change, :string
  end
end
