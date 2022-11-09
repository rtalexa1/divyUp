class AddNoteToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :note, :text
  end
end
