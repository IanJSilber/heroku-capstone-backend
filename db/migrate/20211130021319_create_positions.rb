class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :asset
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
