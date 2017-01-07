class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :status
      t.integer :ball_id
      t.string :dynamodb_table

      t.timestamps
    end
  end
end
