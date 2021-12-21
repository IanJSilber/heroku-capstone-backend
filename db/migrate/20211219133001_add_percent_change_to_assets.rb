class AddPercentChangeToAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :percent_change_1h, :integer
    add_column :assets, :percent_change_24h, :integer
    add_column :assets, :percent_change_7d, :integer
    add_column :assets, :percent_change_30d, :integer
  end
end
