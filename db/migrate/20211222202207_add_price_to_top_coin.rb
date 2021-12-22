class AddPriceToTopCoin < ActiveRecord::Migration[6.1]
  def change
    add_column :top_coins, :price, :integer
  end
end
