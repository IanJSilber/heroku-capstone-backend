class AddPriceToAsset < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :price, :integer
  end
end
