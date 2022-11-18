class CreateCustomSplits < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_splits do |t|
      t.integer :group_id, null: false
      t.integer :total, null: false
      t.integer :group_member_count, null: false
      t.timestamps
    end
    add_index :custom_splits, :group_id
  end
end
