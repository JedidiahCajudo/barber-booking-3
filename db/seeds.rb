# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
Hairstyle.destroy_all  # This clears existing records

Hairstyle.create([
  { name: 'Curly Mullet', image: 'curly_mullet.jpg' },
  { name: 'Curtain Mullet', image: 'curtain_mullet.jpg' },
  { name: 'Mash Perm', image: 'mash_perm.jpg' },
  { name: 'Medium Mullet', image: 'medium_mullet.jpg' },
  { name: 'Short Mullet', image: 'short_mullet.jpg' },
  { name: 'Spiky Mullet', image: 'spiky_mullet.jpg' },
  { name: 'Wavy Mullet', image: 'wavy_mullet.jpg' },
])
