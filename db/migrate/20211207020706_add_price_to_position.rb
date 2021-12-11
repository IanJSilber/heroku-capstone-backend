class AddPriceToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :price, :float
  end
end
