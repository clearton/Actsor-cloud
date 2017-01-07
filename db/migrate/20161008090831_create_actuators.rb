class CreateActuators < ActiveRecord::Migration[5.0]
  def change
    create_table :actuators do |t|
      t.string :name
      t.string :status
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
