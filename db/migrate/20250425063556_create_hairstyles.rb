class CreateHairstyles < ActiveRecord::Migration[7.1]
  def change
    create_table :hairstyles do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
