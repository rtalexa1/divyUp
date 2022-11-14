class AddRequesterColumnToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :requester, :boolean, default: true
    add_index :friendships, :requester
  end
end
