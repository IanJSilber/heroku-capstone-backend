class RemoveThingsFromPositions < ActiveRecord::Migration[6.1]
  def change
    remove_column :positions, :price
    remove_column :positions, :percent_change
    remove_column :positions, :purchase_price
  end
end
