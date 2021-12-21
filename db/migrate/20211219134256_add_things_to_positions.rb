class AddThingsToPositions < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :percent_change_1h, :integer
    add_column :positions, :percent_change_24h, :integer
    add_column :positions, :percent_change_7d, :integer
    add_column :positions, :percent_change_30d, :integer
    add_column :positions, :price, :integer
    add_column :positions, :purchase_price, :integer
    add_column :positions, :symbol, :string
  end
end
