class CreateBalls < ActiveRecord::Migration[5.0]
  def change
    create_table :balls do |t|
      t.string :name
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
