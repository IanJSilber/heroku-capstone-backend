class RemoveAssetFromPosition < ActiveRecord::Migration[6.1]
  def change
    remove_column :positions, :asset
  end
end
