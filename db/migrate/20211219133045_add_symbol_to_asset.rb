class AddSymbolToAsset < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :symbol, :string
  end
end
