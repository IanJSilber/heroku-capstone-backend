class ChangePriceToString < ActiveRecord::Migration[6.1]
  def change
    change_column :positions, :price, :string
  end
end
