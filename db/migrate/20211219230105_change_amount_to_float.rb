class ChangeAmountToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :positions, :amount, :float
  end
end
