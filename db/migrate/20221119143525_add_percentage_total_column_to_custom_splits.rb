class AddPercentageTotalColumnToCustomSplits < ActiveRecord::Migration[7.0]
  def change
    add_column :custom_splits, :percentage_total, :integer, null: false
  end
end
