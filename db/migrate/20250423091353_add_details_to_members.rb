class AddDetailsToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :nickname, :string
    add_column :members, :pronouns, :string
  end
end
