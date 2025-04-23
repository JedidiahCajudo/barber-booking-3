class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :member, null: false, foreign_key: true
      t.datetime :start_time
      t.string :barber
      t.text :notes

      t.timestamps
    end
  end
end
