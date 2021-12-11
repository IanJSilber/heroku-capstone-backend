class RemovePriceFromPosition < ActiveRecord::Migration[6.1]
  def change
    change_column :positions, :price, :integer
  end
end
