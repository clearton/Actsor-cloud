class CreateThresholds < ActiveRecord::Migration[5.0]
  def change
    create_table :thresholds do |t|
      t.integer :sensor_id
      t.string :comparing_string
      t.string :comparing_value
      t.string :status

      t.timestamps
    end
  end
end
