class AddSwitchColumnToActuators < ActiveRecord::Migration[5.0]
  def change
    add_column :actuators, :switch, :boolean
  end
end
