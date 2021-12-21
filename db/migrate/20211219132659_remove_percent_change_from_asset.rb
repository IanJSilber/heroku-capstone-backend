class RemovePercentChangeFromAsset < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :percent_change
  end
end
