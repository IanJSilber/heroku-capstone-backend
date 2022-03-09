class RemoveWatchlistIdFromAsset < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :watchlist_id
    add_column :assets, :user_id, :integer
  end
end
