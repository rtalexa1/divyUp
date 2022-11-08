class AddSettledToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :settled, :boolean, default: false
    add_index :groups, :settled
  end
end
