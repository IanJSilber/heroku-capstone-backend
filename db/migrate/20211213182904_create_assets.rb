class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :price
      t.string :percent_change
      t.string :watchlist_id

      t.timestamps
    end
  end
end
