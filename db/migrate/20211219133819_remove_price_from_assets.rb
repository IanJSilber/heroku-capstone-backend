class RemovePriceFromAssets < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :price
  end
end
