class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.integer :position, limit: 1
      t.string :serial_number, limit: 50
      t.datetime :install_date
      t.references :rebreather, foreign_key: true

      t.timestamps
    end
  end
end
