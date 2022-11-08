class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :name, null: false
      t.integer :total, null: false
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.date :date
      t.timestamps
    end
    add_index :receipts, :name
    add_index :receipts, :user_id
    add_index :receipts, :group_id
    add_index :receipts, :date
  end
end
