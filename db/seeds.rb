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
  { name: 'Buzz Cut', image: 'buzz_cut.jpg' },
  { name: 'Pompadour', image: 'pompadour.jpg' },
  { name: 'Crew Cut', image: 'crew_cut.jpg' },
  { name: 'Modern Mullet', image: 'modern_mullet.jpg' },
  { name: 'Quiff', image: 'quiff.jpg' },
  { name: 'Side Part', image: 'side_part.jpg' },
  { name: 'French Crop', image: 'french_crop.jpg' },
  { name: 'Caesar Cut', image: 'caesar_cut.jpg' },
  { name: 'Comb Over', image: 'comb_over.jpg' },
  { name: 'Bro Flow', image: 'bro_flow.jpg' },
])
