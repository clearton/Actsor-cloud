class AddUnitColumnToSensors < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :unit, :string
  end
end
