class ChangePriceToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :top_coins, :price, :float
    change_column :top_coins, :percent_change_24h, :float
    change_column :top_coins, :percent_change_7d, :float
    change_column :top_coins, :percent_change_30d, :float
  end
end
