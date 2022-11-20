class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.integer :group_id, null: false
      t.boolean :accepted, default: false
      t.timestamps
    end
    add_index :invitations, :sender_id
    add_index :invitations, :recipient_id
    add_index :invitations, :group_id
    add_index :invitations, :accepted
  end
end
