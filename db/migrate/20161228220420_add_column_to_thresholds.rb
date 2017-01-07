class AddColumnToThresholds < ActiveRecord::Migration[5.0]
  def change
    add_column :thresholds, :action, :string
  end
end
