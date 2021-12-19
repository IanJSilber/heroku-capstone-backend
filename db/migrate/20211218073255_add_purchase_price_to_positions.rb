class AddPurchasePriceToPositions < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :purchase_price, :string
  end
end
