class CreateTopCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :top_coins do |t|
      t.integer :rank
      t.string :name
      t.string :symbol
      t.integer :percent_change_24h
      t.integer :percent_change_7d
      t.integer :percent_change_30d

      t.timestamps
    end
  end
end
