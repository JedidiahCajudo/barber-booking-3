class AddHairstyleToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :hairstyle_id, :integer
    add_index :appointments, :hairstyle_id  # Adding an index is optional but helpful for performance
  end
end
