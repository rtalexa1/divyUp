class RemovePendingFromFriendships < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :pending
  end
end
