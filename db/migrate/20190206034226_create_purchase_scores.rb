class CreatePurchaseScores < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_scores do |t|
      t.integer :score, limit: 1
      t.text :description
      t.boolean :deleted, default: 0
      t.integer :user_id
      t.integer :shop_id
      t.integer :purchase_id

      t.timestamps
    end
    add_index :purchase_scores, :purchase_id
  end
end
